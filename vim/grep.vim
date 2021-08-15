" grep
function s:Grep(...)
    if a:0 >= 1
        let keyword = a:1
    else
        let keyword = expand("<cword>")
    end
    let _git_status = system("git status")
    if v:shell_error == 0
        cexpr system('git grep -n ' . keyword . ' **/* 2>/dev/null')
        call setqflist([], 'a', {'title' : 'git grep ' . keyword})
    elseif executable("rg")
        cexpr system('rg --vimgrep ' . keyword . ' 2>/dev/null | grep -v "^Binary file "')
        call setqflist([], 'a', {'title' : 'ripgrep ' . keyword})
    else
        cexpr system('grep -n ' . keyword . ' **/* 2>/dev/null | grep -v "^Binary file "')
        call setqflist([], 'a', {'title' : 'grep ' . keyword})
    endif
    copen
    let g:copend = 1
endfunction
command! -nargs=? Grep :call <sid>Grep(<f-args>)
nnoremap <c-g><c-g> :Grep 

function s:GrepClear()
    cexpr system('true')
    call setqflist([], 'a', {'title' : 'nothing'})
    cclose
    let g:copend = 0
endfunction
command! -nargs=0 GrepClear :call <sid>GrepClear()
