" make invalid
nnoremap <silent><nowait> <F1> <nop>
nnoremap <silent><nowait> <c-space> <nop>

" Command Mode
cnoremap <c-p> <up>
cnoremap <c-n> <down>
nnoremap ! :!
nnoremap <silent><nowait> mk :!make<cr>

" tab
nnoremap <silent><nowait> <c-t> :tabedit<cr>
nnoremap <silent><nowait> <c-p> :tabprevious<cr>
nnoremap <silent><nowait> <c-n> :tabnext<cr>

" Open current-file-path in new tab
nnoremap <silent><nowait> gn :tabedit <c-r>=expand('<cfile>')<cr><cr>
