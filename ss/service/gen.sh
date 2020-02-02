#!/bin/bash
# This script call gen_qr.py to generate the QRCode pictures for SS client settings
# It generate two types of client,
# ShadowsocksX-NG for MacOS with simple-obfs plugin
# Shadowsocks-Android with obfs-local plugin. Install shadowsocks-android and simple-obfs
# It slo generate the SS config URLs
#
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <server_address>"
    exit 1
fi

SERVER_ADDR=$1

for c in `ls outputs/config-*.json`
do
    ./gen_qr.py -c ${c} -s ${SERVER_ADDR} -p simple-obfs
    ./gen_qr.py -c ${c} -s ${SERVER_ADDR} -p obfs-local
done
