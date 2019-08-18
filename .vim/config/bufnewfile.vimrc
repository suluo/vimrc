" 定义函数AutoSetFileHead，自动插入文件头
function! AutoSetFileHead()
    " 如果文件类型为python
    if &filetype == 'python'
        so ~/.vim/config/py_header.vim
    endif
    if &filetype == 'sh'
        so ~/.vim/config/sh_header.vim
    endif
    if &filetype == 'go'
        so ~/.vim/config/go_header.vim
    endif
    if &filetype == 'h' || &filetype == "cpp" || &filetype == "c" 
        so ~/.vim/config/c_header.vim
    endif 
    
    exec "1,8g/Creation Date:.*/s//Creation Date: " .strftime("%Y-%m-%d")
    "如果文件类型为.h文件
    if &filetype == 'h'
        exe "1,9g/^#include.*/s//#pragma once/"
    endif

    normal G
endfunc


function! AutoSetFileTail()
    " 如果文件类型为python
    if &filetype == 'python'
        so ~/.vim/config/py_tailer.vim
    endif

endfunc


" 更新时间
function! AutoChangeModifiedTime()
    execute "normal ma"
    exec "1,9g/File Name.*:.*/s//File Name    : " .expand("%")
    exec "1,9g/Last Modified:.*/s/Last Modified:.*/Last Modified: " .strftime("%Y-%m-%d %H:%M:%S")
    execute "normal `a"
    execute "normal ma"
endfunc
