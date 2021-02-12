" Filer and keymaps for file operations

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
nnoremap <tab> :NERDTreeTabsToggle<cr>

" file location
nn <silent> <leader>f :let @f=expand("%")<cr>:echo "FILE ".@f<cr>
nn <silent> <leader>F :let @f=expand("%:p")<cr>:echo "FILE ".@f<cr>
nn <silent> <leader>d :let @d=expand("%:h")<cr>:echo "DIR ".@d<cr>
nn <silent> <leader>D :let @d=expand("%:p:h")<cr>:echo "DIR ".@d<cr>
nn <silent> gn :tabedit <c-r>=expand('<cfile>')<cr><cr>

" file searching
function s:FileGrepHere(keyword)
    cexpr system('grep -n ' . a:keyword . ' **/* 2>/dev/null | grep -v "^Binary file "')
    call setqflist([], 'a', {'title' : 'grep ' . a:keyword})
    copen
    let g:copend = 1
endfunction
command! -nargs=1 Grep :call <sid>FileGrepHere(<f-args>)
nnoremap <c-g><c-f> :Grep 

function s:GitGrepHere(keyword)
    cexpr system('git grep -n ' . a:keyword . ' **/* 2>/dev/null')
    call setqflist([], 'a', {'title' : 'git grep ' . a:keyword})
    copen
    let g:copend = 1
endfunction
command! -nargs=1 GitGrep :call <sid>GitGrepHere(<f-args>)
nnoremap <c-g><c-g> :GitGrep 

" Filer by Ranger
let g:ranger_map_keys = 0
Plug 'francoiscabrol/ranger.vim'
nnoremap <s-tab> :Ranger<cr>
