Plug 'jackMort/ChatGPT.nvim'

" additional requirements
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/trouble.nvim'
Plug 'nvim-telescope/telescope.nvim'

vnoremap <c-g>h :!codegpt complete -q<cr>
nnoremap <c-g>e :ChatGPTEditWithInstruction<cr>
vnoremap <c-g>e :ChatGPTEditWithInstruction<cr>
