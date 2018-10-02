#!/bin/bash

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

TEMPLATE_DIR=${BASE_DIR}/templates
SERVICE_TEMPLATE_FILE=${TEMPLATE_DIR}/ss.service.tpl
CONFIG_TEMPLATE_FILE=${TEMPLATE_DIR}/config.json.tpl

OUTPUT_DIR=${BASE_DIR}/outputs
OUTPUT_SERIVCE_FILE=${OUTPUT_DIR}/ss.service
OUTPUT_CONFIG_FILE=${OUTPUT_DIR}/config.json

CONFIG_DESTINATION=/home/core/ss

docker run --rm -it -v ${TEMPLATE_DIR}:/data -v ${OUTPUT_DIR}:/out -e TEMPLATE=ss.service.tpl -e OUT_FILE=/out/ss.service -e "PGID=$(id -g)" -e "PUID=$(id -u)" pinterb/jinja2 service_port=$1

docker run --rm -it -v ${TEMPLATE_DIR}:/data -v ${OUTPUT_DIR}:/out -e TEMPLATE=config.json.tpl -e OUT_FILE=/out/config.json -e "PGID=$(id -g)" -e "PUID=$(id -u)" pinterb/jinja2 service_port=$1 service_password=`LC_CTYPE=C tr -dc A-Za-z0-9 < /dev/urandom | head -c 32`

if [ -f ${OUTPUT_SERIVCE_FILE} ]; then
    sudo mv ${OUTPUT_SERIVCE_FILE} /etc/systemd/user/ss-${1}.service
fi

if [ -f ${OUTPUT_CONFIG_FILE} ]; then
    mkdir -p ${CONFIG_DESTINATION}
    sudo mv ${OUTPUT_CONFIG_FILE} ${CONFIG_DESTINATION}/config-${1}.json
fi

if [ -f /etc/systemd/user/ss-${1}.service ]; then
    sudo systemctl enable /etc/systemd/user/ss-${1}.service
    sudo systemctl enable ss-${1}.service
    sudo systemctl start ss-${1}.service
fi
