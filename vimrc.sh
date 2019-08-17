#!/bin/bash
# -*- coding:utf-8 -*-
############################################
# File Name    : vimrc.sh
# Created By   : Suluo - sampson.suluo@gmail.com
# Creation Date: 2019-08-15
# Last Modified: 2019-08-15 19:13:17
# Descption    :
############################################

# 显示命令
set -x
# 报错即刻退出
set -e

cd ~
# 如果有老的 .vim/ 文件夹以及 .vimrc 文件，删掉; 软链接
rm -rf .vim/
rm .vimrc
ln -s vimrc/.vimrc .
ln -s vimrc/.vim .
# 获取vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# .vimrc 生效
source .vimrc
pip install flake8
pip install pep8
pip install isort
