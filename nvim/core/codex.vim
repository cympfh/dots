fun! s:codex_complete(filetype) abort
  let outfile = '/tmp/codex.complete.out.' . expand('%:e')
  let cmd = '! codex complete -p xai -m grok-4-1-fast-reasoning -L ' . a:filetype . ' ' . expand('%') . ' > ' . outfile
  exe cmd
  set splitright
  exe ':vsplit ' . outfile
endfun

au FileType rust nnoremap <buffer><silent> <c-g>x :call <sid>codex_complete("rust")<cr>
au FileType python nnoremap <buffer><silent> <c-g>x :call <sid>codex_complete("python")<cr>
command! -nargs=0 CodeXComplete :call <sid>codex_complete(&filetype)
