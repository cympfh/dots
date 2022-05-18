set number nohlsearch wrap expandtab autoindent smartindent smarttab
set mouse=a
set backspace=start,indent,eol
set wildmode=list:longest
set list listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set foldlevel=0 foldmethod=marker
set undodir=~/.cache/neovim/undo undofile
let mapleader="-"

" load packages
call plug#begin('~/.config/nvim/plugged')
  Plug 'sheerun/vim-polyglot'
  Plug 'terrortylor/nvim-comment'
  Plug 'osyo-manga/vim-brightest'
  let g:brightest#highlight = {"group" : "BrightestUnderline"}
  Plug 'cympfh/journal.vim'
  source ~/.dots/vim/statusline.vim
  source ~/.dots/vim/clipboard.vim
  source ~/.dots/nvim/core/coc.vim
  source ~/.dots/nvim/core/filer.vim
  source ~/.dots/nvim/core/floaterm.vim
call plug#end()

" My Plugins
source ~/.dots/vim/grep.vim
source ~/.dots/vim/keymap.vim
source ~/.dots/vim/eng.vim
source ~/.dots/nvim/core/snippet_rs.vim
source ~/.dots/nvim/core/colortheme.vim
source ~/.dots/nvim/core/comment.lua
source ~/.dots/nvim/core/atcoder.vim
source ~/.dots/nvim/core/runthis.vim
