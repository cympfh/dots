fun! s:codegpt_complete() abort
  let outfile = '/tmp/codegpt.complete.out.' . expand('%:e')
  let cmd = '! codegpt complete -L rust ' . expand('%') . ' > ' . outfile
  exe cmd
  set splitright
  exe ':vsplit ' . outfile
endfun

au FileType rust nnoremap <buffer><silent> <c-g><c-x> :call <sid>codegpt_complete()<cr>
