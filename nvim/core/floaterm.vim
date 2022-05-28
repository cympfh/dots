Plug 'voldikss/vim-floaterm'
nnoremap <c-g><c-t> :FloatermNew --height=0.9 --width=0.9<cr>
au FileType floaterm nnoremap <buffer> <cr> :q<cr>
