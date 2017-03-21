" make invalid
nn <F1> <nop>
nn Q <nop>
nn <c-space> <nop>
nn <cr> <cr>

cnoremap <c-p> <up>
cnoremap <c-n> <down>

" split tab
nn ( <C-w><
nn ) <C-w>>

" operate tab
nnoremap <s-t> :tabnew<cr>
nnoremap <c-p> gT
nnoremap <c-n> gt

" copy the buffer name
nn <silent> <leader>f :let @f=expand("%:p")<cr>:echo @f<cr>

" fork page
nnoremap <c-f> :tabedit %<cr>

" open with the buffer name
nnoremap <leader>e :let @f=":edit ".expand("%:p")<cr>@f

" copy and paste
"
if has('mac')
  nnoremap <leader>y :w !pbcopy<cr>
  vnoremap <leader>y :w !pbcopy<cr>
  nnoremap <leader>p :r !pbpaste<cr>
else
  nnoremap <leader>y :w !xsel -bi<cr>
  vnoremap <leader>y :w !xsel -bi<cr>
  nnoremap <leader>p :r !xsel -bo<cr>
endif

" file browser (hint: use <C-o> and <C-i>)
"
nnoremap B :buffers<cr>:buffer
set splitright splitbelow
" nnoremap gs :split <c-r><c-a><cr><cr>
" nnoremap gv :vsplit <c-r><c-a><cr><cr>
nnoremap gn :tabedit <c-r>=expand('<cfile>')<cr><cr>
" nnoremap gs :split <c-r>=expand('<cfile>')<cr><cr>
" nnoremap gv :vsplit <c-r>=expand('<cfile>')<cr><cr>

nnoremap <left> :N<cr>
nnoremap <right> :n<cr>

" prg
"
nn mk :make!<cr>
nn mc :!make clean<cr>
nn mt :!make test<cr>
nnoremap ! :!

nn <leader>a :vim /\%1l/ *<cr>:copen<cr>
