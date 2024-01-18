fun! s:Capitalize(upper) abort
    let keyword = expand("<cword>")
    if a:upper == 1
        " Make Upper Case
        let cmd = ":%s/\\v\\c<(" . keyword . ")>/\\U\\1/g"
    else
        " Make Lower Case
        let cmd = ":%s/\\v\\c<(" . keyword . ")>/\\L\\1/g"
    endif
    normal mz
    execute cmd
    normal `z
endfun

command! -nargs=0 CapitalizeUpper :call <sid>Capitalize(1)
command! -nargs=0 CapitalizeLower :call <sid>Capitalize(0)

nnoremap <c-g>u :call <sid>Capitalize(1)<cr>
nnoremap <c-g>l :call <sid>Capitalize(0)<cr>
