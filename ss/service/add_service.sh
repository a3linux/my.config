#!/bin/bash

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

TEMPLATE_DIR=${BASE_DIR}/templates
SERVICE_TEMPLATE_FILE=${TEMPLATE_DIR}/ss.service.tpl
CONFIG_TEMPLATE_FILE=${TEMPLATE_DIR}/config.json.tpl

OUTPUT_DIR=${BASE_DIR}/outputs
OUTPUT_SERIVCE_FILE=${OUTPUT_DIR}/ss.service
OUTPUT_CONFIG_FILE=${OUTPUT_DIR}/config.json

docker run --rm -it -v ${TEMPLATE_DIR}:/data -v ${OUTPUT_DIR}:/out -e TEMPLATE=ss.service.tpl -e OUT_FILE=/out/ss.service pinterb/jinja2 service_port=$1

docker run --rm -it -v ${TEMPLATE_DIR}:/data -v ${OUTPUT_DIR}:/out -e TEMPLATE=config.json.tpl -e OUT_FILE=/out/config.json pinterb/jinja2 service_port=$1 service_password=`LC_ALL=C tr -dc A-Za-z0-9 < /dev/urandom | head -c 32`

if [ -f ${OUTPUT_SERIVCE_FILE} ]; then
    mv ${OUTPUT_SERIVCE_FILE} ${OUTPUT_DIR}/ss-${1}.service
fi

if [ -f ${OUTPUT_CONFIG_FILE} ]; then
    mv ${OUTPUT_CONFIG_FILE} ${OUTPUT_DIR}/config-${1}.json
fi
