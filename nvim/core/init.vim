set number

"" load packages
call plug#begin('~/.config/nvim/plugged')
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" tab
nnoremap <silent><nowait> <c-t> :tabedit<cr>
nnoremap <silent><nowait> <c-p> :tabprevious<cr>
nnoremap <silent><nowait> <c-n> :tabnext<cr>

" airline
let g:airline_section_a = ''
let g:airline_section_y = ''
let g:airline_section_z = 'L%l:%c'

"" coc
let g:coc_global_extensions = ['coc-pyright', 'coc-rust-analyzer']
nnoremap <silent> <c-g><c-i> <Plug>(coc-format)
nnoremap <silent> gd :call CocAction('jumpDefinition', 'tabe')<CR>
nnoremap <silent> gD <Plug>(coc-references)
nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

"" colortheme
set background=dark
hi Pmenu        ctermfg=255 ctermbg=237
hi TabLine      ctermfg=246 ctermbg=238 cterm=none
hi TabLineSel   ctermfg=185 cterm=bold
hi TabLineFill  ctermfg=246 ctermbg=238 cterm=none
hi LineNr       ctermfg=238
