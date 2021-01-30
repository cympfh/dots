augroup my_terminal
  autocmd!
  autocmd BufWinEnter,TerminalOpen * if &buftype ==# 'terminal' |
        \     call s:my_term(+expand('<abuf>')) |
        \ endif
augroup END

let s:terms = {}
function! s:my_term(bufnr)
  let tabpagenr = tabpagenr()
  let s:terms[tabpagenr] = a:bufnr
endfunction

function! s:send_to_term(keys)
  let bufnr = get(s:terms, tabpagenr(), 0)
  if bufnr > 0 && bufexists(bufnr)
    let keys = substitute(a:keys, '\n$', '', '')
    call term_sendkeys(bufnr, keys . "\<cr>")
    echo "Sent " . len(keys) . " chars -> " . bufname(bufnr)
  else
    echom "Error: No terminal"
  endif
endfunction

command! -range -bar SendToTerm call s:send_to_term(join(getline(<line1>, <line2>), "\n"))
nnoremap X :SendToTerm<cr>
vnoremap X :SendToTerm<cr>
