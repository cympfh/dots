" Clipboard
if executable('clip')
  nnoremap <leader>y :w !clip<cr>
  vnoremap <leader>y :w !clip<cr>
  nnoremap <leader>p :r !clip<cr>
elseif has('mac')
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
