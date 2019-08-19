### 本项目 .vimrc配置步骤
```
# git clone 获取vim并.vimrc, .vim 正确的位置
.vimrc
.vimrc.local
.vim
    config
    .vimrc.plugins
    .vimrc.cfg.plugins
# 获取plug 插件管理工具
# 安装配置中的vim插件: PlugInstall安装vim插件
```

操作如下
```bash
$ cd ~
$ git clone 
# 获取 Plug: 插件管理工具: https://github.com/junegunn/vim-plug
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# 建立.vim 软链接
$ rm -rf .vim/
$ ln -s vimrc/.vim .
# spf-13
$ ln -s vimrc/.vimrc .vimrc.before.local
$ ln -s vimrc/.vimrc.local .
$ ln -s vimrc/.vim/.vimrc.plugins .vimrc.bundle.local
# .vimrc 生效
$ source .vimrc
# PlguInstall安装vim插件
$ vim
:PlugInstall
# 等待安装完成退出vim
```


### 其他.vimrc配置
[Vimrc复制可用](http://www.cnblogs.com/wangj08/archive/2013/03/13/2957309.html)
[spf13直接可用](https://github.com/spf13/spf13-vim)
```bash
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
```


### git commit
[提交格式检查](https://github.com/conventional-changelog-archived-repos/validate-commit-msg)


### vim配置参考:
[Vim配置、插件和使用技巧](http://www.jianshu.com/p/a0b452f8f720)
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
