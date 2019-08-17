" ---------------------------- --------------
set nocompatible
set showcmd
syntax on
set report=0 "通过使用:comands 命令，告诉我们文件哪一行被改过
set number relativenumber
" ********************************************
" 行号配置: 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
" *********************************************
function! NumberToggle()
   if(&relativenumber == 1)
     set norelativenumber nonumber
   else
     set relativenumber number
   endif
 endfunc
 nnoremap <C-n> :call NumberToggle()<cr>
" ********************************************
" fold配置
" *********************************************
set foldenable              " 开始折叠
"set foldmethod=syntax       " 设置语法折叠
set foldmethod=indent
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码
"set foldclose=all          " 设置为自动关闭折叠                
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠
" ********************************************
" 主题配置
" *********************************************
set t_Co=256
let g:rehash256=1
let g:molokai_original=1
colorscheme desert
set guifont=Courier_new:h14:b:cDEFAULT

" format
set smartindent
set cursorline
" Match & Search
set hlsearch
set showmatch
set ignorecase
set matchtime=1

" 状态行
" set cmdheight=2 " 命令行高度
set scrolloff=5 " when scrolling, keep cursor 5 lines away from screen border
" set mouse=a
" set selection=exclusive
" set selectmode=mouse,key
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1,gb2312,cp936

" tabs and spaces handling
set whichwrap+=<,>,h,l "允许光标和 backspace 跨越行边界
set shiftwidth=4
set softtabstop=4
" set expandtab
set tabstop=4
autocmd FileType python, scala, go setlocal shiftwidth=4 softtabstop=4
autocmd FileType html, htmldjango, javascript setlocal shiftwidth=4 softtabstop=4
autocmd FileType c, cpp setlocal shiftwidth=4 softtabstop=4
autocmd Filetype gitcommit setlocal spell textwidth=72

" *********************************************
" 分割布局相关
" *********************************************
set splitbelow
set splitright
" 快捷键，ctrl+l切换到左边布局，ctrl+h切换到右边布局
" ctrl+k切换到上面布局，ctrl+j切换到下面布局
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" -----------------------
" 键盘
" -----------------------
noremap <silent><expr> j (v:count == 0? 'gj': 'j')
noremap <silent><expr> k (v:count == 0? 'gk': 'k')
set clipboard+=unnamed "共享剪贴板
set mouse=nicr
set completeopt=preview,menu " 代码补全
set pastetoggle=<F11>
" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
" set t_ti= t_te=

" 拼写检查
" set spell
" setlocal spelllang=en_us

filetype plugin indent on
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
" 文件头
source ~/.vim/config/bufnewfile.vimrc
" autocmd BufNewFile *.sh exec ":call AutoSetShFileHead()"
" autocmd BufNewFile *.py,*.go exec ":call AutoSetPyFileHead()"
autocmd BufNewFile *.sh,*.py,*.go exec ":call AutoSetPyFileHead()"
autocmd BufNewFile *.c,*.cpp,*.h exec ":call AutoSetCFileHead()"
autocmd BufWritePre,FileWritePre,FileAppendPre *.py,*.c,*.h,*.cpp execute ":call AutoChangeModifiedTime()"

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Go
" gocode 快捷键
imap <F6> <C-x><C-o>

" 插件安装
if filereadable(expand("~/.vim/.vimrc.bundles"))
source ~/.vim/.vimrc.bundles
endif
" 插件配置
if filereadable(expand("~/.vim/.vimrc.cfg.bundles"))
source ~/.vim/.vimrc.cfg.bundles
endif
""""""""""""""""""""""
"Quickly Run
""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
        elseif &filetype == 'sh'
            :!time bash %
        elseif &filetype == 'python'
            exec "!time python %"
        elseif &filetype == 'html'
            exec "!firefox % &"
        elseif &filetype == 'go'
            exec "!go build %<"
            exec "!time go run %"
        elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
        endif
endfunc

"按F6运行python"
map <F6> :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
    let mp = &makeprg
    let ef = &errorformat
    let exeFile = expand("%:t")
    setlocal makeprg=python\ -u
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    silent make %
    copen
    let &makeprg = mp
    let &errorformat = ef
endfunction
