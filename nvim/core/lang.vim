Plug 'sheerun/vim-polyglot'
Plug 'terrortylor/nvim-comment'

" cumin
au BufRead,BufNewFile *.cumin set filetype=cumin
au BufRead,BufNewFile *.cumin set syntax=rust
au FileType cumin set commentstring=//\ %s
