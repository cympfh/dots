let s:proconDict = []
call add(s:proconDict, [ "cin", ">>" ])
call add(s:proconDict, [ "cout", "<<" ])
call add(s:proconDict, [ "cerr", "<<" ])

fun! s:ProconSubst(i)
  for i in range(0, len(s:proconDict) - 1)
    if getline(a:i) =~ "^ *:" . s:proconDict[i][0]
      let com = ":" . a:i . " s/\\v(>|\\))  *(<|\\()/\\1 " . s:proconDict[i][1] . " \\2/ge | s/:" . s:proconDict[i][0] . "/" . s:proconDict[i][0] . "/ge | s/[^;]$/&;/g"
      silent! :execute com
    endif
  endfor
endfun

fun! s:ProconSubstLine()
  call s:ProconSubst(getpos('.')[1])
endfun

fun! s:ProconSubstRange() range
  for i in range(a:firstline, a:lastline)
    call s:ProconSubst(i)
  endfor
endfun

nn <leader>x :call <SID>ProconSubstLine()<CR>
vn <leader>x :call <SID>ProconSubstRange()<CR>

" nn <leader>x V:!sed -e '/^ *:cin/s/\> * \</ >> /g' -e '/^ *:cin/s/[^;]$/&;/g' -e '/^ *:cin/s/:cin/cin/g' -e '/^ *:cout/s/\> *\</ << /g' -e '/^ *:cout/s/[^;]$/&;/g' -e '/^ *:cout/s/:cout/cout/g'<cr>
" vn <leader>x :!sed -e '/^ *:cin/s/\> * \</ >> /g' -e '/^ *:cin/s/[^;]$/&;/g' -e '/^ *:cin/s/:cin/cin/g' -e '/^ *:cout/s/\> *\</ << /g' -e '/^ *:cout/s/[^;]$/&;/g' -e '/^ *:cout/s/:cout/cout/g'<cr>
