fun! s:codegpt_complete(filetype) abort
  let outfile = '/tmp/codegpt.complete.out.' . expand('%:e')
  let cmd = '! codegpt complete -L ' . a:filetype . ' ' . expand('%') . ' > ' . outfile
  exe cmd
  set splitright
  exe ':vsplit ' . outfile
endfun

au FileType rust nnoremap <buffer><silent> <c-g><c-x> :call <sid>codegpt_complete("rust")<cr>
au FileType python nnoremap <buffer><silent> <c-g><c-x> :call <sid>codegpt_complete("python")<cr>
command! -nargs=0 CodeGPTComplete :call <sid>codegpt_complete(&filetype)
