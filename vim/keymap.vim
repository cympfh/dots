" make invalid
nnoremap <F1> <nop>
nnoremap <c-space> <nop>

" Command Mode
cnoremap <c-p> <up>
cnoremap <c-n> <down>
nnoremap <leader>q q:

" operate tab
nnoremap <c-t> :tabnew<cr>
nnoremap T :tabnew<cr>
nnoremap <c-p> gT
nnoremap <c-n> gt

" prg
nn mk :!make<cr>
nn mc :!make clean<cr>
nnoremap ! :!
