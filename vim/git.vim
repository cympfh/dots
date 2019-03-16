Plugin 'tpope/vim-fugitive'
nn <leader>g :exe 'tabedit % \| Ggrep ' . expand('<cword>')<cr>:copen<cr>
