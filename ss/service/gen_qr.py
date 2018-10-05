#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import qrcode
import base64
import json
import argparse
from os import path

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-c", "--config", dest="conf_file", required=True)
    parser.add_argument("-s", "--server", dest="server_address", required=True)

    args = parser.parse_args()

    if args.conf_file and path.isfile(args.conf_file):
        try:
            with open(args.conf_file, "r") as f:
                conf = json.load(f)
            ss_config_str = "%s:%s@%s:%s" % (conf["method"], conf["password"],
                                                  args.server_address,
                                                  conf["server_port"])
            img = qrcode.make("ss://%s" %
                              base64.b64encode(
                                  ss_config_str.encode('ascii')).decode('ascii'))
            img.save("%s.png" % conf["server_port"])
        except Exception as exp:
            print("Error when generating QRCode %s" % exp)
