:insert
#!/usr/bin/env python
# -*- coding:utf-8 -*-
############################################
# File Name    :
# Created By   : Suluo - sampson.suluo@gmail.com
# Creation Date:
# Last Modified:
# Descption    :
# Version      : Python 3.6
############################################
from __future__ import division
from __future__ import absolute_import
from __future__ import print_function
from __future__ import unicode_literals
import argparse
import time
import os
import sys
import logging
import logging.handlers
import logging.config
# logging.config.fileConfig('./conf/logging.conf')
# logger = logging.getLogger(__file__)





def main(args):
    return args.num


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('-e', '--num', type=int, default=100, help='input num')
    args = parser.parse_args()
    main(args)
