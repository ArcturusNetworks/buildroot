#!/bin/sh

mkdir -p ${TARGET_DIR}/lib/firmware
cp -f ${BUILD_DIR}/uboot-custom/u-boot-rcw-pfe.bin ${BINARIES_DIR}/u-boot-firmware.bin
cp -f ${BUILD_DIR}/linux-custom/br2-ucls1012a-som314s.its ${BINARIES_DIR}/
