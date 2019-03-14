#!/bin/bash

while [ true ];
do
    for config in `ls /home/core/ss/config-*.json`
    do
        ps -ef | grep -v grep | grep ${config}
        if [ $? -ne 0 ]; then
            /home/core/bin/shadowsocks-server -c ${config} &
        fi
    done
done
