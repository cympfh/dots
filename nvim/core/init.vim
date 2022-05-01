set number nohlsearch wrap expandtab autoindent smartindent smarttab
set mouse=a
set backspace=start,indent,eol
set wildmode=list:longest
set foldlevel=0 foldmethod=marker
set undodir=~/.cache/neovim/undo undofile
let mapleader="-"

" load packages
call plug#begin('~/.config/nvim/plugged')
  Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'terrortylor/nvim-comment'
call plug#end()

" tab
nnoremap <silent><nowait> <c-t> :tabedit<cr>
nnoremap <silent><nowait> <c-p> :tabprevious<cr>
nnoremap <silent><nowait> <c-n> :tabnext<cr>

" airline
let g:airline_section_a = ''
let g:airline_section_y = ''
let g:airline_section_z = 'L%l:%c'

" coc
let g:coc_global_extensions = ['coc-pyright', 'coc-rust-analyzer', 'coc-markdownlint', 'coc-translator']
nnoremap <silent> <c-g><c-i> :call CocAction('format')<cr>
nnoremap <silent> gd :call CocAction('jumpDefinition', 'tabe')<cr>
nnoremap <silent> gD :call CocAction('jumpReferences')<cr>
nnoremap <silent> K :call CocAction('doHover')<cr>
nmap <silent> L <Plug>(coc-translator-p)
nnoremap <nowait><expr> <c-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<c-f>"
nnoremap <nowait><expr> <c-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<c-b>"

" colortheme
set background=dark
hi Pmenu        ctermfg=255 ctermbg=237
hi TabLine      ctermfg=246 ctermbg=238 cterm=none
hi TabLineSel   ctermfg=185 cterm=bold
hi TabLineFill  ctermfg=246 ctermbg=238 cterm=none
hi LineNr       ctermfg=238

" Clipboard
nnoremap <silent> <c-g>y :w !clip<cr>
vnoremap <silent> <c-g>y :w !clip<cr>
nnoremap <silent> <c-g>p :r !clip -o<cr>

" Vim Compatible Plugins
source ~/.dots/vim/grep.vim
source ~/.dots/vim/keymap.vim

" NVim Plugins
source ~/.dots/nvim/core/filer.vim
source ~/.dots/nvim/core/snippet_rs.vim
