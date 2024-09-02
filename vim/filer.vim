" Copy File/Dir Name
nn <silent> <c-f>f :let @f=expand("%")<cr>:echo "COPIED FILE: ".@f<cr>
nn <silent> <c-f>d :let @d=expand("%:h")."/"<cr>:echo "COPIED DIR: ".@d<cr>

" Open the current file/dir in new Tab
nn <silent> <c-f>, :exe ":edit " . expand("%:h")."/"<cr>
nn <silent> <c-f>. :exe ":tabedit " . expand("%:h")."/"<cr>
