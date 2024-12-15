#!/usr/bin/env bash


current_dir=$(dirname $0)

export PMDK_INCLUDE_PATH=/usr/local/pmdk-2.1.0/include
export PMDK_LIBRARY_PATH=/usr/local/pmdk-2.1.0/lib

target_dir=/mnt/pmem2/kvdk
engine_type=list # string, sorted, hash, list or blackhole
iswrite=0
if [ "$iswrite" -eq 1 ]; then
    echo "Removing $target_dir ..."
    rm -rf $target_dir
    mkdir -p $target_dir
    read_ratio=0
else
    read_ratio=1
fi
# target_dir=/dev/dax0.3

$current_dir/build/bench \
    -path=$target_dir \
    -space=34359738368 \
    -use_devdax_mode=0 \
    -fill=0 \
    -timeout=10 \
    -threads=1 \
    -max_access_threads=1 \
    -num_kv=10000000 \
    -type=$engine_type \
    -key_distribution=random \
    -value_size=65536 \
    -read_ratio=$read_ratio


