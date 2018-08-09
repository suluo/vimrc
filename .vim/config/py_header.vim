:insert
#!/usr/bin/env python
# -*- coding:utf-8 -*-
############################################
# File Name    :
# Created By   : Suluo - sampson.suluo@gmail.com
# Creation Date:
# Last Modified:
# Descption    :
# Version      : Python 3.7
############################################
import argparse
import time
import os
import sys

import logging
logging.config.fileConfig('./conf/logging.ini')
logger = logging.getLogger(__name__)





def main(args):
    return args.num


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('-e', '--num', type=int, default=100, help='input num')
    args = parser.parse_args()
    main(args)
