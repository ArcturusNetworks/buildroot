#!/bin/sh

mkdir -p ${TARGET_DIR}/home
cp -f ${BUILD_DIR}/uboot-$3/u-boot-rcw-pfe.bin ${BINARIES_DIR}/u-boot-firmware.bin
cp -f ${BUILD_DIR}/uboot-$3/u-boot.bin ${BINARIES_DIR}/u-boot.bin
cp -f ${BUILD_DIR}/linux-custom/$2 ${BINARIES_DIR}/
