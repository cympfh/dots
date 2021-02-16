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

" grep
function s:Grep(keyword)
    let _git_status = system("git status")
    if v:shell_error == 0
        cexpr system('git grep -n ' . a:keyword . ' **/* 2>/dev/null')
        call setqflist([], 'a', {'title' : 'git grep ' . a:keyword})
    elseif executable("rg")
        cexpr system('rg --vimgrep ' . a:keyword . ' 2>/dev/null | grep -v "^Binary file "')
        call setqflist([], 'a', {'title' : 'ripgrep ' . a:keyword})
    else
        cexpr system('grep -n ' . a:keyword . ' **/* 2>/dev/null | grep -v "^Binary file "')
        call setqflist([], 'a', {'title' : 'grep ' . a:keyword})
    endif
    copen
    let g:copend = 1
endfunction
command! -nargs=1 Grep :call <sid>Grep(<f-args>)
nnoremap <c-g><c-g> :Grep 

" Filer by Ranger
let g:ranger_map_keys = 0
Plug 'francoiscabrol/ranger.vim'
nnoremap <s-tab> :Ranger<cr>
