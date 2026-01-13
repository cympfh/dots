" Quickfix
function! s:jump_context()
  if len(getqflist()) > 0 " Quickfix List
    copen
    return 0
  else
    cclose
    return 1
  end
endfunction

function! s:jump_next()
  let ctx = s:jump_context()
  if ctx == 0
    try
      cnext
    catch
      cfirst
    endtry
  else
    echo "Nothing to jump"
  end
endfunction

function! s:jump_prev()
  let ctx = s:jump_context()
  if ctx == 0
    try
      cprev
    catch
      clast
    endtry
  else
    echo "Nothing to jump"
  end
endfunction

nmap <silent><nowait> <c-g><c-n> :call <sid>jump_next()<cr>
nmap <silent><nowait> <c-g><c-p> :call <sid>jump_prev()<cr>
