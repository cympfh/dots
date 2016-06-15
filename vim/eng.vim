" look-up English-Japanese dictionary

fun! s:lookup(word)
  let dict = " ~/.dots/engja"
  exe "!look -f " . tolower(a:word) . " " . dict
endfun
nnoremap L :call <SID>lookup(expand("<cword>"))<cr>
