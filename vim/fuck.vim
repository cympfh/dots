"""
" fuck.vim,
" --- Benri Aliases with Prefix <C-f>
"""

" Copy File/Dir Name
nn <silent> <c-f>f :let @f=expand("%")<cr>:echo "COPIED FILE: ".@f<cr>
nn <silent> <c-f>d :let @d=expand("%:h")."/"<cr>:echo "COPIED DIR: ".@d<cr>

" Open the current file/dir in new Tab
nn <silent> <c-f><c-f> :exe ":tabedit " . expand("%")<cr>
nn <silent> <c-f><c-d> :exe ":tabedit " . expand("%:h")."/"<cr>

" Ranger
nn <silent> <c-f>. :RangerCurrentFile<cr>

" fzf
nn <silent> <c-f>, :Files<cr>
nn <silent> <c-f>m :History<cr>

" MRU
" nn <silent> <c-f>m :MRU<cr>
