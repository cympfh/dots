Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

" Copy File/Dir Name
nnoremap <silent><nowait> <c-f>f :let @f=expand("%")<cr>:echo "COPIED FILE: ".@f<cr>
nnoremap <silent><nowait> <c-f>d :let @d=expand("%:h")."/"<cr>:echo "COPIED DIR: ".@d<cr>

" Open the current file/dir in new Tab
nnoremap <silent><nowait> <c-f><c-f> :exe ":tabedit " . expand("%")<cr>
nnoremap <silent><nowait> <c-f><c-d> :exe ":tabedit " . expand("%:h")."/"<cr>

" fzf
nnoremap <silent><nowait> <c-f>, :Files<cr>
nnoremap <silent><nowait> <c-f>m :History<cr>

Plug 'kevinhwang91/rnvimr'
let g:rnvimr_hide_gitignore = 1
let g:rnvimr_enable_ex = 1
let g:rnvimr_enable_picker = 1
nnoremap <silent><nowait> <c-f>. :RnvimrToggle<cr>
