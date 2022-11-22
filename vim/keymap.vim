" make invalid
nnoremap <silent><nowait> <F1> <nop>
nnoremap <silent><nowait> <c-space> <nop>
nnoremap <silent><nowait> Q q:

" Command Mode
cnoremap <c-p> <up>
cnoremap <c-n> <down>
nnoremap ! :!

" tab
nnoremap <silent><nowait> <c-t> :tabedit<cr>
nnoremap <silent><nowait> <c-p> :tabprevious<cr>
nnoremap <silent><nowait> <c-n> :tabnext<cr>

" Make
nnoremap <silent><nowait> mk :!make<cr>
nnoremap <silent><nowait> mc :!make clean<cr>

" Open current-file-path in new tab
nnoremap <silent><nowait> gn :tabedit <c-r>=expand('<cfile>')<cr><cr>

" toggle :set paste
fun! s:toggle_paste() abort
  if &paste == 0
    set paste
    echo "(paste)"
  else
    set nopaste
    echo "(nopaste)"
  endif
endfun
nnoremap <silent> <c-g><c-p> :call <sid>toggle_paste()<cr>
inoremap <silent> <c-g><c-p> <esc>:call <sid>toggle_paste()<cr>i
