nn <silent> gn :tabedit <c-r>=expand('<cfile>')<cr><cr>

" File Operations
nn <silent> <c-f>f :let @f=expand("%")<cr>:echo "COPIED FILE ".@f<cr>
nn <silent> <c-f>d :let @f=expand("%:h")<cr>:echo "COPIED DIR ".@f<cr>
nn <silent> <c-f>t :tabedit <c-r>=expand("%")<cr><cr>
nmap <silent> <c-f><c-f> <c-f>f
nmap <silent> <c-f><c-d> <c-f>d
nmap <silent> <c-f><c-t> <c-f>t

" Filer
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1
Plug 'francoiscabrol/ranger.vim'
nnoremap <c-f>. :RangerCurrentFile<cr>

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
