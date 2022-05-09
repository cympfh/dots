let g:run_config = {
      \ 'awk': 'awk -f %',
      \ 'cpp': 'g++ % -o /tmp/out && /tmp/out',
      \ 'javascript': 'node %',
      \ 'python': 'python %',
      \ 'ruby': 'ruby %',
      \ 'rust': 'rustc % -o /tmp/out && /tmp/out',
      \ 'sh': 'bash %',
      \ }

function! s:RunThis()
  if has_key(g:run_config, &filetype)
    let cmd = g:run_config[&filetype]
    let cmd = expandcmd(cmd)
    let title = '$ ' . cmd . ' '
    call floaterm#new(0, cmd, {}, {'height': 0.9, 'width': 0.9, 'title': title, 'autoclose': 0})
  else
    echo 'Error! I dont know how to run filetype=' . &filetype
  endif
endfunction

nnoremap <silent><nowait> <c-g><c-r> :call <sid>RunThis()<cr>
