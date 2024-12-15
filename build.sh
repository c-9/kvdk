#!/usr/bin/env bash
export PMDK_INCLUDE_PATH=/usr/local/pmdk-2.1.0/include
export PMDK_LIBRARY_PATH=/usr/local/pmdk-2.1.0/lib
export KVDK_ROOT=/usr/local/kvdk
rm -rf build && mkdir -p build && cd build
CC=/usr/bin/gcc-9 CXX=/usr/bin/g++-9 cmake .. \
-DCMAKE_BUILD_TYPE=Release \
-DCHECK_CPP_STYLE=OFF \
-DCMAKE_INSTALL_PREFIX=$KVDK_ROOT \
-DCMAKE_CXX_FLAGS="-fPIC" \
-DCMAKE_C_FLAGS="-fPIC"
make -j 64
sudo make install
cd - 
