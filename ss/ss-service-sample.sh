#!/bin/bash

docker run -d --rm --name ss-<xxxxx> -p <xxxxx>:<xxxxx> -v $<PATH-TO-CONFIG>/config.json:/tmp/config.json a3linux/goss -c /tmp/config.json
