#!/bin/bash

############################################
# OSSPR2021                                #
#                                          #
# Builds your ARM64 kernel.                 #
############################################

set -e

# Did you install ccache?
type ccache

# Some cleanups and setups
rm -f arch/arm64/boot/Image
rm -f arch/arm64/boot/dts/broadcom/*.dtb
CROSS_COMPILER=aarch64-linux-gnu-

# Build .config
make ARCH=arm64 CROSS_COMPILE="$CROSS_COMPILER" tizen_bcmrpi3_defconfig

# Build kernel
make ARCH=arm64 CROSS_COMPILE="$CROSS_COMPILER" -j$(nproc)
