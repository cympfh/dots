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
set list listchars=tab:;_,trail:@
let mapleader="-"
set colorcolumn=100 synmaxcol=200
set undodir=~/.vim/undo undofile

"" Bundle git@github.com:gmarik/Vundle.vim.git
"
set rtp+=~/.vim/Vundle.vim/
call vundle#rc()

source ~/.dots/vim/keymap.vim
source ~/.dots/vim/prg.vim
source ~/.dots/vim/procon.vim
source ~/.dots/vim/eng.vim
source ~/.dots/vim/statusline.vim
source ~/.dots/vim/misc.vim

set cryptmethod=blowfish2
set fencs=utf8,euc-jp,sjis,cp932,default,latin1

filetype plugin indent on
