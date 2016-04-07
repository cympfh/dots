fun! s:includegraphics(file)
  let bb = system("identify " . a:file . " | cut -d' ' -f3|sed 's/x/ /'")
  let bs = split(bb)
  let @b = "\\includegraphics[width=1.0\\textwidth,bb=0 0 " . bs[0] . " " . bs[1] . "]{" . a:file . "}"
  put b
endfun

fun! s:columns()
  let @b = "\\begin{columns}\n  \\column{.5\\textwidth}\n  \\column{.5\\textwidth}\n\\end{columns}\n"
  put b
endfun

fun! s:frame()
  let @b = "\\begin{frame}{}\n\\end{frame}"
  put b
endfun

command! -nargs=1 -complete=file IncludeGraphics call <SID>includegraphics("<args>")
command! -nargs=0 Columns call <SID>columns()
command! -nargs=0 Frame call <SID>frame()
