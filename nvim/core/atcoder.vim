let s:atcoder_script = expand('<sfile>:h').'/atcoder.sh'

fun! s:cargo_atcoder(action) abort
  let problem_id = expand('%:t:r')
  let cmd = 'bash ' . s:atcoder_script
  let cmd .= ' --problem-id ' . problem_id
  let cmd .= ' ' . a:action
  call floaterm#new(0, cmd, {}, {'height': 0.9, 'width': 0.9, 'title': ' cargo-atcoder '.a:action.' '})
endfun

fun! s:open_atcoder() abort
  let problem_id = expand('%:t:r')
  let cmd = '! open-browser ' . s:atcoder_script
  exec cmd
endfun

au FileType rust nnoremap <buffer><silent> <c-g>0 :call <sid>cargo_atcoder('test')<cr>
au FileType rust nnoremap <buffer><silent> <c-g>1 :call <sid>cargo_atcoder('test --sample-id 1')<cr>
au FileType rust nnoremap <buffer><silent> <c-g>2 :call <sid>cargo_atcoder('test --sample-id 2')<cr>
au FileType rust nnoremap <buffer><silent> <c-g>3 :call <sid>cargo_atcoder('test --sample-id 3')<cr>
au FileType rust nnoremap <buffer><silent> <c-g>- :call <sid>cargo_atcoder('status')<cr>
au FileType rust nnoremap <buffer><silent> <c-g>= :call <sid>cargo_atcoder('submit')<cr>
au FileType rust nnoremap <buffer><silent> <c-g><c-b> :call <sid>open_atcoder()<cr>
