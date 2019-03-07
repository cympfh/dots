" Filer and keymaps for file operations

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
nnoremap <space> :NERDTreeTabsToggle<CR>

" file location
nn <silent> <leader>f :let @f=expand("%:p")<cr>:echo "FILE ".@f<cr>
nn <silent> <leader>d :let @d=expand("%:h")<cr>:echo "DIR ".@d<cr>
nn <silent> <leader>F :let @f=":edit ".expand("%:p")<cr>@f
nn <silent> <leader>D :let @d=":edit ".expand("%:h")<cr>@d<cr>
nn <silent> gn :tabedit <c-r>=expand('<cfile>')<cr><cr>

nn <leader>a :vim /\%1l/ *<cr>:copen<cr>
