Plugin 'tpope/vim-fugitive'
nn <leader>g :exe 'tabedit % \| Ggrep ' . expand('<cword>')<cr><cr>

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
