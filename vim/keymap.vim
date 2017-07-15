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

" file location
nn <silent> <leader>f :let @f=expand("%:p")<cr>:echo "FILE ".@f<cr>
nn <silent> <leader>d :let @d=expand("%:h")<cr>:echo "DIR ".@d<cr>
nn <silent> <leader>F :let @f=":edit ".expand("%:p")<cr>@f
nn <silent> <leader>D :let @d=":edit ".expand("%:h")<cr>@d<cr>
nn <silent> gn :tabedit <c-r>=expand('<cfile>')<cr><cr>

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

" prg
"
nn M :make 
nn mk :make!<cr>
nn mc :!make clean<cr>
nn mt :!make test<cr>
nnoremap ! :!

nn <leader>a :vim /\%1l/ *<cr>:copen<cr>
nn <left> :cprev<cr>
nn <right> :cnext<cr>
