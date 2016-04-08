set nobackup noswapfile
set ambiwidth=single
set number ruler showcmd incsearch nohlsearch showmatch
set autoindent smartindent
set modeline modelines=2 history=50
set foldlevel=100 foldmethod=marker
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set backspace=start,indent,eol
set wildmode=longest,list,full
set timeout ttimeoutlen=100
set mouse=
set list listchars=tab:»-
let mapleader="-"
set synmaxcol=200

"" Bundle git@github.com:gmarik/Vundle.vim.git
"
set rtp+=~/.vim/Vundle.vim/
call vundle#rc()

source ~/.dots/vim/keymap.vim
" source ~/.dots/vim/appearance.light.vim
source ~/.dots/vim/appearance.dark.vim
source ~/.dots/vim/prg.vim
source ~/.dots/vim/procon.vim
source ~/.dots/vim/eng.vim
source ~/.dots/vim/misc.vim
if exists('~/.dots/vim/hatena.vim')
  source ~/.dots/vim/hatena.vim
endif

if has('mac')
  set cryptmethod=blowfish2
end
set fencs=utf8,euc-jp,sjis,cp932,default,latin1

filetype plugin indent on
