" Clipboard
if executable('clip')
  nnoremap <c-g>y :w !clip<cr>
  vnoremap <c-g>y :w !clip<cr>
  " nnoremap <c-g>p :r !clip -o <bar> nkf<cr>  " 壊れてる!!
elseif has('mac')
  nnoremap <c-g>y :w !pbcopy<cr>
  vnoremap <c-g>y :w !pbcopy<cr>
  nnoremap <c-g>p :r !pbpaste<cr>
elseif executable('xsel')
  nnoremap <c-g>y :w !xsel -bi<cr>
  vnoremap <c-g>y :w !xsel -bi<cr>
  nnoremap <c-g>p :r !xsel -bo<cr>
else
  nnoremap <c-g>y :w! /tmp/vim.clipboard<cr>
  vnoremap <c-g>y :w! /tmp/vim.clipboard<cr>
  nnoremap <c-g>p :r /tmp/vim.clipboard<cr>
endif

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
nnoremap <silent> <c-g><c-o> :call <sid>toggle_paste()<cr>
inoremap <silent> <c-g><c-o> <esc>:call <sid>toggle_paste()<cr>i
