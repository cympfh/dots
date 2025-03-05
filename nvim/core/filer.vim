" Copy File/Dir Name
nnoremap <silent><nowait> <c-f>f :let @f=expand("%")<cr>:echo "COPIED FILE: ".@f<cr>
nnoremap <silent><nowait> <c-f>d :let @d=expand("%:h")."/"<cr>:echo "COPIED DIR: ".@d<cr>

" Open the current directory
nnoremap <silent><nowait> <c-f>, :exe ":edit " . expand("%:h") . "/"<cr>
nnoremap <silent><nowait> <c-f>. :exe ":tabedit " . expand("%:h") . "/"<cr>

Plug 'stevearc/oil.nvim'
Plug 'echasnovski/mini.icons'  " for oil.nvim
