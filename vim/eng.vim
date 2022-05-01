" look-up English-Japanese dictionary

fun! s:lookup(word)
  let dict = " ~/Dropbox/share/EngJa"
  exe "!look -f " . tolower(a:word) . " " . dict
endfun
nnoremap L :call <sid>lookup(expand("<cword>"))<cr>
