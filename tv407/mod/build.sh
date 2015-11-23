#!/bin/bash

# modules to copy
MOD_LIST="fc0012.ko fc0013.ko fc2580.ko dvb-usb-rtl28xxu.ko rtl2832.ko af9013.ko dvb-core.ko dvb_usb_v2.ko qt1010.ko af9033.ko dvb-pll.ko fc0011.ko rtl2830.ko dib0070.ko dvb-usb-af9015.ko s5h1411.ko dib0090.ko dvb-usb-af9035.ko it913x-fe.ko tda18218.ko dib3000mc.ko dvb-usb-dib0700.ko lgdt3305.ko tda18271.ko dib7000m.ko dvb-usb-dtt200u.ko mc44s803.ko tua9001.ko dib7000p.ko dvb-usb-it913x.ko mt2060.ko tuner-xc2028.ko dib8000.ko mt2266.ko xc4000.ko dib9000.ko mxl5005s.ko xc5000.ko dibx000_common.ko dvb-usb.ko mxl5007t.ko"

# $1 - top of linux-media directory
# $2 - destination directory
copy_mod() {
	SRC_DIR=$1
	DST_DIR=$2

	test -z "${SRC_DIR}" -o ! -d ${SRC_DIR} && echo Wrong source directory && exit 1
	test -z "${DST_DIR}" && echo Wrong destination directory && exit 1
	mkdir -p ${DST_DIR} &&\
		test ! -d ${DST_DIR} && echo Fail to create destination directory && exit 1

	for mm in ${MOD_LIST}; do
		find ${SRC_DIR} \-name "${mm}" \-exec cp {} ${DST_DIR} \;
		test ! -f ${DST_DIR}/${mm} && echo Fail to copy ${mm}
	done
}


#path of docker container
export ARCH=x86_64
KVER=3.12.6
export PATH=/root/CT/${ARCH}-QNAP-linux-gnu/cross-tools/bin:$PATH
export CROSS_COMPILE=${ARCH}-QNAP-linux-gnu-
TOP_KDIR=/root/kernel
TOP_BDIR=/root/build
TOP_MDIR=/root/linux-media
TOP_RDIR=/root/release
CUR_KDIR=${TOP_KDIR}/linux-${KVER}
CUR_BDIR=${TOP_BDIR}/${KVER}/${ARCH}
CUR_MDIR=${TOP_MDIR}/${KVER}
CUR_RDIR=${TOP_RDIR}/${KVER}/${ARCH}

mkdir -p ${CUR_BDIR}
cp ${TOP_KDIR}/cfg-${KVER}-${ARCH} ${CUR_BDIR}/.config
make -C ${CUR_KDIR} O=${CUR_BDIR} oldconfig
make -C ${CUR_KDIR} O=${CUR_BDIR} prepare
make -C ${CUR_KDIR} O=${CUR_BDIR} modules_prepare
echo "#define UTS_RELEASE \"${KVER}\"" >${CUR_BDIR}/include/generated/utsrelease.h
make -C ${CUR_KDIR} O=${CUR_BDIR} M=${CUR_MDIR}
copy_mod ${CUR_MDIR} ${CUR_RDIR}

