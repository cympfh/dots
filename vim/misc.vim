Bundle 'h1mesuke/vim-alignta'
Bundle 'yegappan/mru'
Bundle 'itchyny/screensaver.vim'
Bundle 'mattn/webapi-vim'
" Bundle 'Shougo/unite.vim'

" hatena blog
Bundle 'moznion/hateblo.vim'
let g:hateblo_vim = {
     \ 'user':         'cympfh',
     \ 'api_key':      'zzc6ws2142',
     \ 'api_endpoint': 'https://blog.hatena.ne.jp/cympfh/cympfh.hatenablog.jp/atom',
     \ 'WYSIWYG_mode': 0,
     \ 'always_yes':   0,
     \ 'edit_command': 'edit'
\ }

" comment out
Bundle "tyru/caw.vim"
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

" async
" Bundle 'idbrii/AsyncCommand'
nn mk :make<cr>

" Syntastic
" Bundle 'cympfh/syntastic-async'
Bundle 'scrooloose/syntastic.git'
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['tex']
      \ }

