import argparse
import os
import subprocess
import shutil
import glob
import sys

def run_command(command, shell=True, cwd=None):
    """Executes a shell command, exiting on failure."""
    print(f"\n>>> {command}\n")
    if os.name == 'nt':  # Windows: run via PowerShell for consistent quoting
        command = f'powershell.exe -Command "{command}"'
    result = subprocess.run(command, shell=shell, check=False, text=True, cwd=cwd)
    if result.returncode != 0:
        sys.exit(result.returncode)
    return result

def main():
    parser = argparse.ArgumentParser(description="CMake Build and Test Script")
    parser.add_argument('--platform', required=True,
                        choices=['linux_x64', 'linux_x86', 'osx', 'win32', 'win64', 'uwp'],
                        help='Platform to build for')
    parser.add_argument('--cfg', default='Debug', choices=['Release', 'Debug'],
                        help='Configuration Type')
    parser.add_argument('--build', action='store_true', help='Execute the build step')
    parser.add_argument('--test', action='store_true', help='Execute the test step')
    parser.add_argument('--coverage', action='store_true', help='Generate code coverage report')
    parser.add_argument('--extra-cmake', default='',
                        help='Extra cmake flags, e.g. "-DGA_SHARED_LIB=OFF -DGA_BUILD_SAMPLE=OFF"')
    parser.add_argument('--build-target', default='',
                        help='Optional: only build this CMake target (e.g., GameAnalytics)')
    parser.add_argument('--clean', action='store_true',
                        help='Delete build/ before configuring')
    # New argument to trigger packaging
    parser.add_argument('--package', action='store_true',
                        help='Copy build artifacts to the lib/ directory for packaging')
    args = parser.parse_args()

    build_output_dir = os.path.join(os.getcwd(), 'Build', args.cfg)

    if args.clean and os.path.exists(build_output_dir):
        print(">>> Deleting existing Build/ directory")
        shutil.rmtree(build_output_dir)

    os.makedirs(build_output_dir, exist_ok=True)

    # Configure CMake
    cmake_command = f'cmake -B "{build_output_dir}" -S "{os.getcwd()}"'
    # Force the library output to the root of the build directory for consistency
    cmake_command += f' -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY="{build_output_dir}"'

    if args.platform == 'osx':
        cmake_command += ' -G "Xcode"'
    if args.platform:
        cmake_command += f' -DPLATFORM:STRING={args.platform}'
    if args.coverage:
        cmake_command += ' -DENABLE_COVERAGE=ON'
    if args.extra_cmake:
        cmake_command += f' {args.extra_cmake.strip()}'
    run_command(cmake_command)

    # Build
    if not args.build:
        sys.exit(0)
    build_cmd = f'cmake --build "{build_output_dir}" --config {args.cfg}'
    if args.build_target:
        build_cmd += f' --target {args.build_target}'
    run_command(build_cmd)

    # Test
    if args.test:
        run_command(f'ctest --build-config {args.cfg} --verbose --output-on-failure',
                    cwd=build_output_dir)

    # Package
    if not args.package:
        return
        
    print("\n>>> Packaging build artifacts...")

    lib_name = "libGameAnalytics.a"
    if 'win' in args.platform:
        lib_name = "GameAnalytics.lib"
    
    source_lib_path = os.path.join(build_output_dir, lib_name)

    if not os.path.exists(source_lib_path):
        print(f"Error: Library file not found at {source_lib_path}")
        sys.exit(1)

    # Determine destination directory based on our conanfile.py layout
    os_name, arch_name = "", ""
    if args.platform == 'win64':
        os_name, arch_name = 'Windows', 'x86_64'
    elif args.platform == 'win32':
        os_name, arch_name = 'Windows', 'x86'
    elif args.platform == 'linux_x64':
        os_name, arch_name = 'Linux', 'x86_64'
    elif args.platform == 'linux_x86':
        os_name, arch_name = 'Linux', 'x86'
    else:
        print(f"Warning: Packaging not configured for platform '{args.platform}'. Skipping.")
        return

    dest_dir = os.path.join(os.getcwd(), 'lib', os_name, arch_name, args.cfg)
    os.makedirs(dest_dir, exist_ok=True)
    dest_lib_path = os.path.join(dest_dir, lib_name)

    print(f">>> Copying {source_lib_path} to {dest_lib_path}")
    shutil.copy(source_lib_path, dest_lib_path)
    print(">>> Packaging complete.")

if __name__ == "__main__":
    main()
