Plug 'sheerun/vim-polyglot'
Plug 'terrortylor/nvim-comment'
Plug 'petRUShka/vim-sage'

" cumin
au BufRead,BufNewFile *.cumin set filetype=cumin
au BufRead,BufNewFile *.cumin set syntax=rust
au FileType cumin set commentstring=//\ %s

" sage math
au BufRead,BufNewFile *.sage set filetype=sage.python
