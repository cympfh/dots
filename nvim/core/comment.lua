require('nvim_comment').setup({
	comment_empty = false,
	create_mappings = false,
})
vim.api.nvim_command("nnoremap <c-g>c :CommentToggle<cr>")
vim.api.nvim_command("vnoremap <c-g>c :CommentToggle<cr>")
