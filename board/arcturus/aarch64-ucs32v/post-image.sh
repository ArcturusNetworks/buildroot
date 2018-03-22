#!/bin/sh

BOARD_DIR="$(dirname $0)"
MKIMAGE=${HOST_DIR}/usr/bin/mkimage
MKIMAGE_IN=${BINARIES_DIR}/br2-ucs32v.its
MKIMAGE_OUT=${BINARIES_DIR}/part0-000000.itb
cp ${BOARD_DIR}/br2-ucs32v.its ${BINARIES_DIR}/
${MKIMAGE} -f ${MKIMAGE_IN} ${MKIMAGE_OUT}
