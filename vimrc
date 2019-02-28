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
set autoread
autocmd InsertEnter,WinEnter * checktime

"
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

source ~/.dots/vim/keymap.vim
source ~/.dots/vim/prg.vim
source ~/.dots/vim/git.vim
source ~/.dots/vim/ctags.vim
source ~/.dots/vim/procon.vim
source ~/.dots/vim/eng.vim
source ~/.dots/vim/statusline.vim
source ~/.dots/vim/filer.vim
source ~/.dots/vim/misc.vim

call vundle#end()
filetype plugin indent on

set cryptmethod=blowfish2
set fencs=utf8,euc-jp,sjis,cp932,default,latin1
