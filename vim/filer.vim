" Filer
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1
Plug 'francoiscabrol/ranger.vim'
nnoremap <tab> :RangerCurrentFile<cr>
nnoremap <s-tab> :RangerCurrentFileNewTab<cr>

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
