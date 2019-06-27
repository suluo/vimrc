### .vimrc配置
[Vimrc复制可用](http://www.cnblogs.com/wangj08/archive/2013/03/13/2957309.html)

[Vim配置、插件和使用技巧](http://www.jianshu.com/p/a0b452f8f720)

### .vimrc配置步骤
```
# git clone 获取vim并.vimrc, .vimrc.bundle, config正确的位置
.vimrc
.vim
    config
    .vimrc.bundle
# 安装vundle管理vim插件： git clone 获取vundle
# 安装配置中的vim插件: BundleInstall安装vim插件
```

操作如下
```bash
# git clone 获取vim配置并且放在正确的位置
$ cd ~
$ git clone https://github.com/Suluo/vimrc.git
$ cd ~
# 如果有老的 .vim/ 文件夹以及 .vimrc 文件，删掉; 软链接
$ rm -rf .vim/
$ rm .vimrc
$ ln -s vimrc/.vimrc .
$ ln -s vimrc/.vim .
# 获取vundle
$ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# .vimrc 生效
$ source .vimrc
# BundleInstall安装vim插件
$ vim
:BundleInstall
# 等待安装完成退出vim
# 安装go相关插件
# :GoInstallBinaries
# 编译 YouCompleteMe
$ cd ~/.vim/bundle/vundle/YouCompleteMe
$ ./install.py --clang-completer
```

### git commit
[提交格式检查](https://github.com/conventional-changelog-archived-repos/validate-commit-msg)


### vim配置参考:
#### 插件配置
[把vim配置成顺手的python轻量级IDE](http://www.jianshu.com/p/f0513d18742a)
##### pydiction
[pydiction补全配置设置](http://zhujiangtao.blog.51cto.com/6387416/1384003)
##### Neocomplete
[极客方案 ：将 VIM 打造成 Markdown 利器](https://sspai.com/post/36111)
```bash
brew install vim --with-lua
```

##### YouCompleteMe
需要vim7.4

[Vim代码自动补全的神器：YouCompleteMe](http://blog.jobbole.com/58978/)

##### mark-down
[vim 配置markdown语法高亮](http://luodw.cc/2015/09/26/vim-md/)

##### scala-vim
[vim配置支持Scala语法高亮](https://wongxingjun.github.io/2015/04/15/vim%E9%85%8D%E7%BD%AE%E6%94%AF%E6%8C%81Scala%E8%AF%AD%E6%B3%95%E9%AB%98%E4%BA%AE/)
