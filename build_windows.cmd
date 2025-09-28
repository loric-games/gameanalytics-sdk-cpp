@echo off
setlocal
REM Run from the script's folder to avoid path surprises
cd /d "%~dp0"

REM Build GameAnalytics (static) for Win64 Debug and Release with MT runtime, no samples
python setup.py --platform win64 --cfg Debug --build --clean --extra-cmake "-DGA_SHARED_LIB=OFF -DGA_BUILD_SAMPLE=OFF -DBUILD_SHARED_LIBS=OFF -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded" --build-target GameAnalytics
python setup.py --platform win64 --cfg Release --build --clean --extra-cmake "-DGA_SHARED_LIB=OFF -DGA_BUILD_SAMPLE=OFF -DBUILD_SHARED_LIBS=OFF -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded" --build-target GameAnalytics

exit /b %ERRORLEVEL%
