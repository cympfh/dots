set nobackup noswapfile
set ambiwidth=single
set number ruler showcmd incsearch nohlsearch showmatch
set autoindent smartindent
set modeline modelines=2 history=50
set foldlevel=100 foldmethod=marker
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set backspace=start,indent,eol
set wildmode=longest,list,full
set timeout ttimeoutlen=100
set mouse=
set list listchars=tab:__,trail:-
set fillchars=vert:\ 
let mapleader="-"
set colorcolumn=100 synmaxcol=200
set undodir=~/.vim/undo undofile
set scrolloff=4
set completeopt=popup,menu
set clipboard=
set belloff=all

" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

source ~/.dots/vim/keymap.vim
source ~/.dots/vim/clipboard.vim
source ~/.dots/vim/langs.vim
source ~/.dots/vim/snippet.vim
source ~/.dots/vim/terminal.vim
source ~/.dots/vim/eng.vim
source ~/.dots/vim/statusline.vim
source ~/.dots/vim/filer.vim
source ~/.dots/vim/grep.vim
source ~/.dots/vim/fuck.vim
source ~/.dots/vim/misc.vim
source ~/.dots/vim/colorscheme.vim
source ~/.dots/vim/calc.vim

call plug#end()
set cryptmethod=blowfish2
set fileencodings=utf8,euc-jp,sjis,cp932,default,latin1
set encoding=utf-8
set fileformats=unix
syntax on
