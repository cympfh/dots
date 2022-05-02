let s:atcoder_script = expand('<sfile>:h').'/atcoder.sh'

fun! s:CargoAtCoder(action) abort
  let win_width = winwidth('%') - 2
  let win_height = winheight('%') - 4
  let problem_id = expand('%:t:r')
  let cmd = 'bash ' . s:atcoder_script
  let cmd .= ' --problem-id ' . problem_id
  let cmd .= ' --width ' . win_width
  let cmd .= ' ' . a:action
  let buf = nvim_create_buf(v:false, v:true)
  call nvim_open_win(buf, v:true, {
        \ 'relative': 'cursor',
        \ 'row': 2,
        \ 'col': 1,
        \ 'width': win_width,
        \ 'height': win_height
        \ })
  let term = {}
  function! term.on_exit(id, code, ...)
    bdelete!
  endfunction
  call termopen(cmd, term)
  setlocal nospell bufhidden=wipe nobuflisted nonumber
  startinsert
  return []
endfun

au FileType rust nnoremap <buffer><silent> <c-g>0 :call <sid>CargoAtCoder('test')<cr>
au FileType rust nnoremap <buffer><silent> <c-g>1 :call <sid>CargoAtCoder('test --sample-id 1')<cr>
au FileType rust nnoremap <buffer><silent> <c-g>2 :call <sid>CargoAtCoder('test --sample-id 2')<cr>
au FileType rust nnoremap <buffer><silent> <c-g>3 :call <sid>CargoAtCoder('test --sample-id 3')<cr>
au FileType rust nnoremap <buffer><silent> <c-g>- :call <sid>CargoAtCoder('status')<cr>
au FileType rust nnoremap <buffer><silent> <c-g>= :call <sid>CargoAtCoder('submit')<cr>
