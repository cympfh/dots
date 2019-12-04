" Filer and keymaps for file operations

" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
nnoremap <space> :NERDTreeTabsToggle<CR>
autocmd FileType nerdtree nnoremap <buffer> f :NERDTreeFind 

" file location
nn <silent> <leader>f :let @f=expand("%")<cr>:echo "FILE ".@f<cr>
nn <silent> <leader>F :let @f=expand("%:p")<cr>:echo "FILE ".@f<cr>
nn <silent> <leader>d :let @d=expand("%:h")<cr>:echo "DIR ".@d<cr>
nn <silent> <leader>D :let @d=expand("%:p:h")<cr>:echo "DIR ".@d<cr>
nn <silent> gn :tabedit <c-r>=expand('<cfile>')<cr><cr>

" file searching
function s:FileGrepHere(keyword)
    cexpr system('grep -n ' . a:keyword . ' **/* 2>/dev/null \| grep -v "^Binary file "')
    call setqflist([], 'a', {'title' : 'grep ' . a:keyword})
    copen
endfunction
command! -nargs=1 Grep :call <SID>FileGrepHere(<f-args>)

function s:GitGrepHere(keyword)
    cexpr system('git grep -n ' . a:keyword . ' **/* 2>/dev/null')
    call setqflist([], 'a', {'title' : 'git grep ' . a:keyword})
    copen
endfunction
command! -nargs=1 GitGrep :call <SID>GitGrepHere(<f-args>)

" Filer by Ranger
function! Ranger()
    let temp = tempname()
    exec 'silent !ranger --choosefiles=' . shellescape(temp)
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    exec 'edit ' . fnameescape(names[0])
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction

nnoremap , :call Ranger()<CR>
