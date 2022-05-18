" Clipboard
if executable('clip')
  nnoremap <c-g>y :w !clip<cr>
  vnoremap <c-g>y :w !clip<cr>
  nnoremap <c-g>p :r !clip -o <bar> nkf<cr>
elseif has('mac')
  nnoremap <c-g>y :w !pbcopy<cr>
  vnoremap <c-g>y :w !pbcopy<cr>
  nnoremap <c-g>p :r !pbpaste<cr>
elseif executable('xsel')
  nnoremap <c-g>y :w !xsel -bi<cr>
  vnoremap <c-g>y :w !xsel -bi<cr>
  nnoremap <c-g>p :r !xsel -bo<cr>
else
  nnoremap <c-g>y :w! /tmp/vim.clipboard<cr>
  vnoremap <c-g>y :w! /tmp/vim.clipboard<cr>
  nnoremap <c-g>p :r /tmp/vim.clipboard<cr>
endif
