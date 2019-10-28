" Filer and keymaps for file operations

" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
nnoremap <space> :NERDTreeTabsToggle<CR>
autocmd FileType nerdtree nnoremap <buffer> f :NERDTreeFind 
autocmd FileType nerdtree nnoremap <buffer> p :call NERDTreeLivePreview()<CR>

function! NERDTreeLivePreview()
    let current_file = g:NERDTreeFileNode.GetSelected()
    if current_file == {}
        return
    else
        exe 'pedit '.current_file.path.str()
    endif
endfunction

" file location
nn <silent> <leader>f :let @f=expand("%")<cr>:echo "FILE ".@f<cr>
nn <silent> <leader>F :let @f=expand("%:p")<cr>:echo "FILE ".@f<cr>
nn <silent> <leader>d :let @d=expand("%:h")<cr>:echo "DIR ".@d<cr>
nn <silent> <leader>D :let @d=expand("%:p:h")<cr>:echo "DIR ".@d<cr>
nn <silent> gn :tabedit <c-r>=expand('<cfile>')<cr><cr>

" file searching
function! s:FileLocate(path)
    cexpr system('locate ' . a:path . ' \| sed "s/.*/&:0:&/g"')
    call setqflist([], 'a', {'title' : 'locate ' . a:path})
    copen
endfunction

command! -nargs=1 Locate :call <SID>FileLocate(<f-args>)

function s:FileGrepHere(keyword)
    cexpr system('grep -n ' . a:keyword . ' **/* 2>/dev/null \| grep -v "^Binary file "')
    call setqflist([], 'a', {'title' : 'grep ' . a:keyword})
    copen
endfunction

command! -nargs=1 GrepHere :call <SID>FileGrepHere(<f-args>)
