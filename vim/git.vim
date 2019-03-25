Plugin 'tpope/vim-fugitive'
nn <leader>G :exe 'tabedit % \| Ggrep ' . expand('<cword>')<cr>:copen<cr>
