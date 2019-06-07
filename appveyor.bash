#!/usr/bin/bash
export MSYSTEM=MINGW64
wget http://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-boost-1.67.0-2-any.pkg.tar.xz
pacman --noconfirm -U mingw-w64-x86_64-boost-1.67.0-2-any.pkg.tar.xz
#pacman --noconfirm -S  mingw-w64-x86_64-boost; #mingw-w64-x86_64-openssl
mkdir /msys64
mount C:/msys64 /msys64;
cd $APPVEYOR_BUILD_FOLDER/bitshares-core;
cmake -G "MSYS Makefiles" . -DOPENSSL_CONF_SOURCE="C:/msys64/mingw64/ssl/openssl.cnf" -DOPENSSL_ROOT_DIR=/mingw64 -DBOOST_ROOT=/mingw64;
cmake --build . -j 2 --target install;
echo "Build finished!"
