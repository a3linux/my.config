#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import qrcode
import base64
import urllib.parse
import json
import argparse
from os import path

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-c", "--config", dest="conf_file", required=True)
    parser.add_argument("-s", "--server", dest="server_address", required=True)
    parser.add_argument("-p", "--plugin", dest="plugin_name", required=True)

    args = parser.parse_args()

    if args.conf_file and path.isfile(args.conf_file):
        try:
            with open(args.conf_file, "r") as f:
                conf = json.load(f)
            plugin_str = "plugin=%s;obfs=tls;obfs-host=www.bing.com#" % args.plugin_name
            _ss_secret_str = "%s:%s" % (conf["method"], conf["password"])
            ss_secret_str = base64.b64encode(
                    _ss_secret_str.encode('ascii')).decode('ascii')
            print("ss://%s@%s:%s/?%s" % (
                ss_secret_str, args.server_address,
                conf["server_port"], plugin_str
                ))
            img = qrcode.make("ss://%s@%s:%s/?%s" % (
                ss_secret_str, args.server_address,
                conf["server_port"], plugin_str
                ))
            img.save("%s-%s.png" % (conf["server_port"], args.plugin_name))
        except Exception as exp:
            print("Error when generating QRCode %s" % exp)
