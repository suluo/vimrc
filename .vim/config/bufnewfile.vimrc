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
    
    exec "1,8g/File Name.*:.*/s//File Name    : " .expand("%")
    exec "1,8g/Creation Date:.*/s//Creation Date: " .strftime("%Y-%m-%d")
    exec "1,8g/Last Modified:.*/s//Last Modified: " .strftime("%Y-%m-%d %H:%M:%S")

    normal G
endfunc

function! AutoSetCFileHead()
    if &filetype == 'h' || &filetype == "cpp" || &filetype == "c" 
        so ~/.vim/config/c_header.vim
        exe "1,6g/File Name    :.*/s//File Name    : " .expand("%")
        exe "1,6g/Creation Date:.*/s//Creation Date: " .strftime("%Y-%m-%d")
        exe "1,6g/Last Modified:.*/s//Last Modified: " .strftime("%Y-%m-%d %H:%M:%S")

        "如果文件类型为.h文件
        if &filetype == 'h'
            exe "1,9g/^#include.*/s//#pragma once/"
        endif
    endif

    normal G
    normal o
endfunc

" 更新时间
function! AutoChangeModifiedTime()
    execute "normal ma"
    exe "1,9g/File Name.*:.*/s//File Name    : " .expand("%")
    exe "1,9g/Last Modified:.*/s/Last Modified:.*/Last Modified: " .strftime("%Y-%m-%d %H:%M:%S")
    execute "normal `a"
    execute "normal ma"
endfunc
