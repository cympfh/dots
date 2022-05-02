fun! s:SnippetRs()
  let s:cmd = '~/git/cympfh.github.io/procon/procon-rs/bin/snippet-rs'
  let s:tmp = '/tmp/snippet-rs-out'
  let s:currentfile = expand('%:p')
  let buf = nvim_create_buf(v:false, v:true)
  call nvim_open_win(buf, v:true, {
        \ 'relative': 'cursor',
        \ 'row': 1,
        \ 'col': 0,
        \ 'width': winwidth('%'),
        \ 'height': winheight('%') / 2
        \ })
  let term = { 'buf': bufnr(''),
            \ 'pbuf': bufnr(''),
            \ 'winrest': winrestcmd(),
            \ 'lines': &lines,
            \ 'columns': &columns,
            \ 'command': 'ls' }
  function! term.on_exit(id, code, ...)
    if bufexists(self.buf)
      execute 'bd!' self.buf
    endif
    exe ':read ' . s:tmp
    write
  endfunction
  call termopen(s:cmd . ' --ref ' . s:currentfile . ' > ' . s:tmp, term)
  setlocal nospell bufhidden=wipe nobuflisted nonumber
  startinsert
  return []
endfun

command! SnippetRs :call <sid>SnippetRs()
au FileType rust nnoremap <buffer><silent> <c-g><c-s> :SnippetRs<cr>
