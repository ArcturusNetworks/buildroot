#!/bin/sh

MKIMAGE=${HOST_DIR}/usr/bin/mkimage
MKIMAGE_IN=${BINARIES_DIR}/br2-ucls1012a-som120.its
MKIMAGE_OUT=${BINARIES_DIR}/part0-000000.itb
${MKIMAGE} -f ${MKIMAGE_IN} ${MKIMAGE_OUT}
rm -f ${BINARIES_DIR}/br2-ucls1012a-som120.its

