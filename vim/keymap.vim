" make invalid
nn <F1> <nop>
nn Q <nop>
nn <c-space> <nop>
nn <cr> <cr>

cnoremap <c-p> <up>
cnoremap <c-n> <down>

" split tab
nn ( <C-w><<C-w>+
nn ) <C-w>><C-w>-

" operate tab
nnoremap <s-t> :tabnew<cr>
nnoremap <c-t> :tabnew<cr>
nnoremap <c-p> gT
nnoremap <c-n> gt

" copy and paste
"
if has('mac')
  nnoremap <leader>y :w !pbcopy<cr>
  vnoremap <leader>y :w !pbcopy<cr>
  nnoremap <leader>p :r !pbpaste<cr>
elseif executable('xsel')
  nnoremap <leader>y :w !xsel -bi<cr>
  vnoremap <leader>y :w !xsel -bi<cr>
  nnoremap <leader>p :r !xsel -bo<cr>
else
  nnoremap <leader>y :w! /tmp/vim.clipboard<cr>
  vnoremap <leader>y :w! /tmp/vim.clipboard<cr>
  nnoremap <leader>p :r /tmp/vim.clipboard<cr>
endif

" prg
"
nn M :make 
nn mk :!make<cr>
nn mc :!make clean<cr>
nn mt :!make test<cr>
nnoremap ! :!
