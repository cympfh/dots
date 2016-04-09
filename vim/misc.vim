Bundle 'h1mesuke/vim-alignta'
Bundle 'yegappan/mru'
Bundle 'itchyny/screensaver.vim'
Bundle 'mattn/webapi-vim'
" Bundle 'Shougo/unite.vim'

" comment out
Bundle "tyru/caw.vim"
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)

" Syntastic
Bundle 'scrooloose/syntastic.git'
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['tex']
      \ }
