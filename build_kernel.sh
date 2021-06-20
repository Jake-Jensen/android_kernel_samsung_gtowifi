#!/bin/bash

export ARCH=arm64
export CROSS_COMPILE=$(pwd)/../PLATFORM/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-

mkdir $(pwd)/out
make -C $(pwd) O=$(pwd)/out KCFLAGS=-mno-android P81080_msm8937_defconfig
make -j16 -C $(pwd) O=$(pwd)/out KCFLAGS=-mno-android DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y
                
cp $(pwd)/out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image