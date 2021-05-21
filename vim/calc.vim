function! s:evalexpr()
  let line = getline(".")
  let res = execute("echo " . line)
  let res = trim(res)
  call setline(line("."), res)
endfunction

nnoremap <silent> E :call <sid>evalexpr()<cr>
