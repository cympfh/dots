" Jump Lines

function! s:jump_context()
  if len(getqflist()) > 0 " Quickfix List
    let g:copend = 1
    copen
    return 0
  elseif len(ale#list#GetCombinedList()) > 0 " ALE Fix List
    return 1
  else
    return -1
  end
endfunction

function! s:jump_next()
  let ctx = s:jump_context()
  if ctx == 0
    cnext
  elseif ctx == 1
    ALENext
  else
    echo "Nothing to do"
  end
endfunction

function! s:jump_prev()
  let ctx = s:jump_context()
  if ctx == 0
    cprev
  elseif ctx == 1
    ALEPrevious
  else
    echo "Nothing to do"
  end
endfunction

nmap <silent> <c-g><c-n> :call <sid>jump_next()<cr>
nmap <silent> <c-g><c-p> :call <sid>jump_prev()<cr>
