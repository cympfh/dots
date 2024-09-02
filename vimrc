set number nohlsearch wrap expandtab autoindent smartindent smarttab
set tabstop=4 shiftwidth=4 softtabstop=4
set nobackup nowritebackup noswapfile
set mouse=a
set backspace=start,indent,eol
set wildmode=list:longest
set list listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set foldlevel=0 foldmethod=marker
set ambiwidth=single
set ruler showcmd incsearch showmatch
set modeline modelines=2 history=50
set timeout ttimeoutlen=100
let mapleader="-"
set colorcolumn=100 synmaxcol=200
set undodir=~/.vim/undo undofile
set scrolloff=4
set completeopt=popup,menu

" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
  Plug 'osyo-manga/vim-brightest'
  let g:brightest#highlight = {"group" : "BrightestUnderline"}
  Plug 'cympfh/journal.vim'
  source ~/.dots/vim/langs.vim
  source ~/.dots/vim/terminal.vim
  source ~/.dots/vim/eng.vim
  source ~/.dots/vim/statusline.vim
  source ~/.dots/vim/filer.vim
  source ~/.dots/vim/grep.vim
  source ~/.dots/vim/misc.vim
  source ~/.dots/vim/colorscheme.vim
  source ~/.dots/vim/jump.vim
call plug#end()

source ~/.dots/vim/keymap.vim
source ~/.dots/vim/clipboard.vim
source ~/.dots/vim/snippet.vim
source ~/.dots/vim/sandwich.vim

set cryptmethod=blowfish2
set fileencodings=utf8,euc-jp,sjis,cp932,default,latin1
set encoding=utf-8
set fileformats=unix
syntax on
