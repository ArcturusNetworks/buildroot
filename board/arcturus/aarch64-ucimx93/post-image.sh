#!/bin/sh

################################################################################
# Linux + DTB + rootfs = part0-000000.itb
################################################################################

BOARD_DIR="$(dirname $0)"

cp -f ${BOARD_DIR}/$2 ${BINARIES_DIR}/

MKIMAGE=${HOST_DIR}/usr/bin/mkimage
MKIMAGE_IN=${BINARIES_DIR}/$2
MKIMAGE_OUT=${BINARIES_DIR}/part0-000000.itb
${MKIMAGE} -f ${MKIMAGE_IN} ${MKIMAGE_OUT}
rm -f ${BINARIES_DIR}/$2
