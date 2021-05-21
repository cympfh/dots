Plug 'cympfh/journal.vim'
Plug 'vim-scripts/renamer.vim'
Plug 'tpope/vim-sleuth'
" Plug 'vim-scripts/speeddating.vim'

" MRU
let MRU_Max_Entries = 1000
let MRU_Use_Current_Window = 1
Plug 'yegappan/mru'

" comment out
Plug 'tyru/caw.vim'
nmap <leader>c <Plug>(caw:hatpos:toggle)
vmap <leader>c <Plug>(caw:hatpos:toggle)

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
