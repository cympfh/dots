Plug 'cympfh/journal.vim'
Plug 'vim-scripts/renamer.vim'
Plug 'tpope/vim-sleuth'

" comment out
Plug 'tyru/caw.vim'
nmap <c-g>c <Plug>(caw:hatpos:toggle)
vmap <c-g>c <Plug>(caw:hatpos:toggle)

let g:copend = 0
function! Ctoggle()
  if g:copend == 0
    let g:copend = 1
    copen
  else
    let g:copend = 0
    cclose
  end
endfunction
nn <bs> :call Ctoggle()<cr>

" https://github.com/osyo-manga/vim-brightest
Plug 'osyo-manga/vim-brightest'

" markdown/latex
vnoremap $ s$<C-r>"$<esc>
