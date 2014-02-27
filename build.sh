#!/bin/bash

export ARCH=arm
export SUBARCH=arm

export LOCALVERSION="-Origin04"

export CROSS_COMPILE=/home/dryize/android/toolchains/optimized/arm-cortex_a9-linux-gnueabihf-linaro_4.7.4-2014.01/bin/arm-cortex_a9-linux-gnueabihf-

make clean

make ap33_android_defconfig
make

make ARCH=arm -C drivers/net/wireless/compat-wireless_R5.SP2.03 KLIB=`pwd` KLIB_BUILD=`pwd` clean
make ARCH=arm -C drivers/net/wireless/compat-wireless_R5.SP2.03 KLIB=`pwd` KLIB_BUILD=`pwd`

echo "Enter a name for the kernel :"

read kname

mkdir ../out/$kname
cp ../out/dummy/* ../out//$knmae// -r

cp arch/arm/boot/zImage ../out//$knmae//
find . -name '*ko' -exec cp '{}' ../out//$knmae//system/lib/modules/ \;


#./../out/tools/mkbootimg --kernel ../out/s2w_o3/zImage --ramdisk ../out/tools/ramdisk.cpio.gz --ramdiskaddr 0x0050C4F0  -o ../out/s2w_o3/kernel/boot.img
