let s:atcoder_script = expand('<sfile>:h').'/atcoder.sh'
let s:terminal_windows = []

function! s:border_window(width, height, title) abort
  let width_left = (a:width - 4 - len(a:title)) / 2
  let width_right = (a:width - 4 - len(a:title) + 1) / 2
  let top = "╭" . repeat("─", width_left) . " " . a:title . " " . repeat("─", width_right) . "╮"
  let mid = "│" . repeat(" ", a:width - 2) . "│"
  let bot = "╰" . repeat("─", a:width - 2) . "╯"
  let lines = [top] + repeat([mid], a:height - 2) + [bot]
  let buffer = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(buffer, 0, -1, v:true, lines)
  let config = {
        \ 'relative': 'editor',
        \ 'row': 2,
        \ 'col': 1,
        \ 'style': 'minimal',
        \ 'width': a:width,
        \ 'height': a:height,
        \ }
  return nvim_open_win(buffer, v:true, config)
endfunction

function! s:terminal_window(width, height, action, problem_id) abort
  let cmd = 'bash ' . s:atcoder_script
  let cmd .= ' --problem-id ' . a:problem_id
  let cmd .= ' ' . a:action
  let buf = nvim_create_buf(v:false, v:true)
  let config = {
        \ 'relative': 'editor',
        \ 'row': 3,
        \ 'col': 3,
        \ 'style': 'minimal',
        \ 'width': a:width,
        \ 'height': a:height,
        \ }
  call nvim_open_win(buf, v:true, config)
  let term = {}
  function! term.on_exit(id, code, ...)
    bdelete!
  endfunction
  let win = termopen(cmd, term)
  setlocal nospell bufhidden=wipe nobuflisted nonumber
  autocmd BufWinLeave <buffer> call s:close_windows()
  startinsert
  return win
endfunction

function! s:close_windows(...)
  call nvim_win_close(s:terminal_windows[0], v:true)
endfunction

fun! s:cargo_atcoder(action) abort
  let problem_id = expand('%:t:r')
  let w0 = s:border_window(winwidth('%') - 2, winheight('%') - 4, a:action)
  let w1 = s:terminal_window(winwidth('%') - 4, winheight('%') - 2, a:action, problem_id)
  let s:terminal_windows = [w0, w1]
  return []
endfun

au FileType rust nnoremap <buffer><silent> <c-g>0 :call <sid>cargo_atcoder('test')<cr>
au FileType rust nnoremap <buffer><silent> <c-g>1 :call <sid>cargo_atcoder('test --sample-id 1')<cr>
au FileType rust nnoremap <buffer><silent> <c-g>2 :call <sid>cargo_atcoder('test --sample-id 2')<cr>
au FileType rust nnoremap <buffer><silent> <c-g>3 :call <sid>cargo_atcoder('test --sample-id 3')<cr>
au FileType rust nnoremap <buffer><silent> <c-g>- :call <sid>cargo_atcoder('status')<cr>
au FileType rust nnoremap <buffer><silent> <c-g>= :call <sid>cargo_atcoder('submit')<cr>
