" make invalid
nn <F1> <nop>
nn <c-space> <nop>

cnoremap <c-p> <up>
cnoremap <c-n> <down>

" operate tab
nnoremap <c-t> :tabnew<cr>
nnoremap T :tabnew<cr>
nnoremap <c-p> gT
nnoremap <c-n> gt

" prg
nn mk :!make<cr>
nn mc :!make clean<cr>
nnoremap ! :!
