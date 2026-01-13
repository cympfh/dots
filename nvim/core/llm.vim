Plug 'github/copilot.vim'

fun! s:codegen_complete(filetype) abort
  let outfile = '/tmp/codegen.complete.out.' . expand('%:e')
  let cmd = '! codegen complete -L ' . a:filetype . ' ' . expand('%') . ' > ' . outfile
  exe cmd
  set splitright
  exe ':vsplit ' . outfile
  windo diffthis
endfun

au FileType rust nnoremap <buffer><silent> <c-g>g :call <sid>codegen_complete("rust")<cr>
au FileType python nnoremap <buffer><silent> <c-g>g :call <sid>codegen_complete("python")<cr>
command! -nargs=0 CodeGen :call <sid>codegen_complete(&filetype)
