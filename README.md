
### 安装与使用（超简版）

- **1. 克隆仓库**

```bash
cd ~
git clone git@github.com:YOUR_NAME/vimrc.git
```

- **2. 建立软链接**

```bash
cd ~
rm -rf .vim/ .vimrc
ln -s ~/vimrc/.vimrc ~/.vimrc
ln -s ~/vimrc/.vimrc.local ~/.vimrc.local
ln -s ~/vimrc/.vim ~/.vim
```

- **3. 安装 vim-plug（若还未安装）**

```bash
[ -f ~/.vim/autoload/plug.vim ] || curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- **4. 安装插件**

```bash
vim +PlugInstall +qall
```

完成后，重新打开 `vim` 即可使用本配置。该配置 **完全基于 vim-plug**，不依赖 `spf13-vim`。


### 可选：使用仓库里的 `.bashrc`

如果你想复用本仓库提供的常用别名和 `extract` 函数，可以建立一个软链接：

```bash
cd ~
mv ~/.bashrc ~/.bashrc.backup  # 如已存在则先备份
ln -s ~/vimrc/.bashrc ~/.bashrc
```

重新打开终端后，`ls`/`ll`/`la` 等别名及 `extract` 函数即可生效。
