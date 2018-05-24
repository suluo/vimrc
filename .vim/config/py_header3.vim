:insert
#!/usr/bin/env python
# -*- coding:utf-8 -*-
############################################
# File Name    :
# Created By   : Suluo - sampson.suluo@gmail.com
# Creation Date:
# Last Modified:
# Descption    :
# Version      : Python 2.7
############################################
from __future__ import division
# import os
import argparse
import sys
# reload(sys)
# sys.setdefaultencoding("utf-8")
import logging
from logging import getLogger, INFO
from cloghandler import ConcurrentRotatingFileHandler
# import traceback

logging.config.dictConfig({
    'version': 1,
    'disable_existing_loggers': True,
    'formatters': {
        'verbose': {
            'format': "[%(asctime)s] %(levelname)s [%(name)s:%(lineno)s] %(message)s",
            'datefmt': "%Y-%m-%d %H:%M:%S"
        }
    },
    'handlers': {
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
            'formatter': 'verbose'
        },
        'file': {
            'level': 'DEBUG',
            # 'class': 'logging.RotatingFileHandler',
            'class': 'cloghandler.ConcurrentRotatingFileHandler', # 多进程
            'maxBytes': 1024 * 1024 * 10,  # 当达到10MB时分割日志
            'backupCount': 50,    # 最多保留50份文件
            # If delay is true,
            # then file opening is deferred until the first call to emit().
            'delay': True,
            'filename': 'logs/mysite.log',
            'formatter': 'verbose'
        }
    },
})

logger = logging.getLogger(__file__)



def main(num):
    return num


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('-e', '--num', type=int, default=100, help='demo input num')
    args = parser.parse_args()
    main(args.num)
