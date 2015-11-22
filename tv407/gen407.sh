#!/bin/bash

PROJ_BUILD=build
SERVICE=img
IMG_BUILD=${PROJ_BUILD}_${SERVICE}
IMG_CONTAINER=${PROJ_BUILD}_${SERVICE}_1

IMG_NAME=tv407
IMG_TAR=${IMG_NAME}.tar

#build libiconv and tvheadend
#todo check existence of tv407_src_* and tv407_img_*
cd ${PROJ_BUILD}
docker-compose -f tmp.yml up

#create build image
docker-compose up
docker export ${IMG_CONTAINER} >${IMG_TAR}

#remove instances
docker rm ${PROJ_BUILD}_tmp_1 ${IMG_CONTAINER} ${PROJ_BUILD}_src_1
docker rmi ${IMG_BUILD}
docker import - tv407_raw <${IMG_TAR}
rm ${IMG_TAR}
docker build -t tv407
