#!/usr/bin/env bash
export PMEM_ROOT=/usr/local/pmdk-2.1.0
export KVDK_ROOT=/usr/local/kvdk
rm -rf build && mkdir -p build && cd build
CC=/usr/bin/gcc CXX=/usr/bin/g++ cmake .. \
-DPMEM_ROOT=$PMEM_ROOT \
-DCMAKE_BUILD_TYPE=Release \
-DCHECK_CPP_STYLE=OFF \
-DBUILD_TUTORIAL=OFF \
-DCMAKE_INSTALL_PREFIX=$KVDK_ROOT \
-DCMAKE_CXX_FLAGS="-fPIC" \
-DCMAKE_C_FLAGS="-fPIC"
make -j 64 && sudo make install
cd - 
