import argparse
import os
import subprocess
import shutil
import glob
import sys

def run_command(command, shell=True, cwd=None):
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
    # new, minimal knobs:
    parser.add_argument('--extra-cmake', default='',
                        help='Extra cmake flags, e.g. "-DGA_SHARED_LIB=OFF -DGA_BUILD_SAMPLE=OFF"')
    parser.add_argument('--build-target', default='',
                        help='Optional: only build this CMake target (e.g., GameAnalytics)')
    parser.add_argument('--clean', action='store_true',
                        help='Delete build/ before configuring')

    args = parser.parse_args()

    build_output_dir = os.path.join(os.getcwd(), 'Build',args.cfg)
    os.makedirs(build_output_dir, exist_ok=True)

    cmake_command = f'cmake -B "{build_output_dir}" -S "{os.getcwd()}"'
    if args.platform == 'osx':
        cmake_command += ' -G "Xcode"'
    if args.platform:
        cmake_command += f' -DPLATFORM:STRING={args.platform}'
    if args.coverage:
        cmake_command += ' -DENABLE_COVERAGE=ON'
    if args.extra_cmake:
        cmake_command += f' {args.extra_cmake.strip()}'

    run_command(cmake_command)

    if args.build:
        build_cmd = f'cmake --build "{build_output_dir}" --config {args.cfg}'
        if args.build_target:
            build_cmd += f' --target {args.build_target}'
        run_command(build_cmd)
    else:
        sys.exit(0)

    if args.test:
        run_command(f'ctest --build-config {args.cfg} --verbose --output-on-failure',
                    cwd=build_output_dir)
    else:
        pass



if __name__ == "__main__":
    main()
