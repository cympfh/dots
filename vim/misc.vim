Plugin 'h1mesuke/vim-alignta'
Plugin 'renamer.vim'
Plugin 'tpope/vim-sleuth'

let MRU_Max_Entries = 1000
let MRU_Use_Current_Window = 1
Plugin 'yegappan/mru'

" comment out
Plugin 'tyru/caw.vim'
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)

" undo tree
Plugin 'sjl/gundo.vim'
let g:gundo_prefer_python3 = 1

" copen
nn <left> :cprev<cr>
nn <right> :cnext<cr>

let g:copend=0
function! Ctoggle()
  if g:copend == 0
    let g:copend = 1
    :copen
  else
    let g:copend = 0
    :close
  end
endfunction
nn <leader><leader> :call Ctoggle()<cr>
