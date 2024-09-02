set nobackup noswapfile
set ambiwidth=single
set number ruler showcmd incsearch nohlsearch showmatch
set autoindent smartindent
set modeline modelines=2 history=50
set foldlevel=0 foldmethod=marker
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set backspace=start,indent,eol
set wildmode=list:longest
set timeout ttimeoutlen=100
set mouse=a
set list listchars=tab:__,trail:-
set fillchars=vert:\ 
let mapleader="-"
set colorcolumn=100 synmaxcol=200
set undodir=~/.vim/undo undofile
set scrolloff=4
set completeopt=popup,menu

" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
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
