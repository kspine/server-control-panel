@echo off

echo.
echo "Building dependencies using MSVC"
echo.



echo -- Building zlib
echo.
pushd "%~dp0"
cd third-party\zlib
:: 1) configure
cmake -G"%CMAKE_GENERATOR%" CMakeLists.txt -B./build -DCMAKE_INSTALL_PREFIX=../../libs
:: 2) make
msbuild .\build\zlib.vcxproj /p:Configuration=Release /verbosity:minimal /p:OutDir=..\..\..\libs\
msbuild .\build\zlibstatic.vcxproj /p:Configuration=Release /verbosity:minimal /p:OutDir=..\..\..\libs\
popd
echo Done.
echo.

echo -- Building QuaZip
echo.
pushd "%~dp0"
cd third-party\quazip\quazip
:: 1) configure
mkdir build && cd build
cmake .. -G"%CMAKE_GENERATOR%" -DCMAKE_INSTALL_PREFIX=../../../libs -DCONFIG+=statliclib -DINCLUDEPATH="$$PWD/../../zlib" -DLIBS+="-L$$PWD/../../../libs -lz" -DDESTDIR="$$PWD/../../../libs"
:: 2) make
cmake --build . --config %CONFIGURATION%
popd
echo Done.
echo.