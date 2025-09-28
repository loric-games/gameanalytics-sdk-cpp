import argparse
import os
import subprocess
import shutil
import glob
import sys

def run(cmd, cwd=None):
    if os.name == 'nt':
        cmd = f'powershell.exe -Command "{cmd}"'
    print(f"\n>>> {cmd}\n")
    r = subprocess.run(cmd, shell=True, cwd=cwd)
    if r.returncode != 0:
        sys.exit(r.returncode)

def main():
    p = argparse.ArgumentParser(description="Minimal GA CMake build")
    p.add_argument('--platform', required=True,
                   choices=['linux_x64','linux_x86','osx','win32','win64','uwp'])
    p.add_argument('--cfg', default='Debug', choices=['Release','Debug'])
    p.add_argument('--build', action='store_true')
    p.add_argument('--test', action='store_true')
    p.add_argument('--coverage', action='store_true')
    args = p.parse_args()

    build_dir = os.path.join(os.getcwd(), 'Build')
    os.makedirs(build_dir, exist_ok=True)

    # Configure
    cmake = [
        'cmake',
        f'-B "{build_dir}"',
        f'-S "{os.getcwd()}"',
        f'-DPLATFORM:STRING={args.platform}',
        '-DGA_SHARED_LIB=OFF',
        '-DGA_BUILD_SAMPLE=OFF'
    ]
    if args.platform == 'osx':
        cmake.append('-G "Xcode"')
    if args.coverage:
        cmake.append('-DENABLE_COVERAGE=ON')

    run(' '.join(cmake))

    # Build
    if args.build:
        run(f'cmake --build "{build_dir}" --config {args.cfg}')
    else:
        sys.exit(0)

    # (Optional) tests / coverage – unchanged from original
    if args.test:
        run(f'ctest --build-config {args.cfg} --verbose --output-on-failure', cwd=build_dir)
    if args.coverage:
        run(f'cmake --build "{build_dir}" --target cov', cwd=build_dir)

    # Package: copy lib + headers into Build/package
    pkg = os.path.join(build_dir, 'package')
    os.makedirs(pkg, exist_ok=True)

    for f in glob.glob(os.path.join(build_dir, args.cfg, '*GameAnalytics.*')):
        shutil.copy(f, pkg)

    inc_src = os.path.join(os.getcwd(), 'include')
    if os.path.isdir(inc_src):
        shutil.copytree(inc_src, os.path.join(pkg, 'include'), dirs_exist_ok=True)

    # List package contents
    if os.name == 'nt':
        run(f'dir "{pkg}"')
    else:
        run(f'ls -la "{pkg}"')
    if args.platform == 'osx':
        run(f'lipo -info {pkg}/*GameAnalytics.*')

if __name__ == "__main__":
    main()