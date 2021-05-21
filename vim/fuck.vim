"""
" fuck.vim,
" --- Benri Aliases with Prefix <C-f>
"""

" Help
nn <c-f><c-f> :echo system("cat ~/.dots/vim/fuck.vim")<cr>

" Copy File/Dir Name
nn <silent> <c-f>f :let @f=expand("%")<cr>:echo "COPIED FILE: ".@f<cr>
nn <silent> <c-f>d :let @d=expand("%:h")."/"<cr>:echo "COPIED DIR: ".@d<cr>

" Duplicate tab
nn <silent> <c-f>t :tabedit <c-r>=expand("%")<cr><cr>

" Ranger
nn <silent> <c-f>. :RangerCurrentFile<cr>

" MRU
nn <silent> <c-f>m :MRU<cr>
