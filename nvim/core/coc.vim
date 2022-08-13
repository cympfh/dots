Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [
      \'coc-pyright',
      \'coc-rust-analyzer',
      \'coc-go',
      \'coc-sqlfluff',
      \]

nnoremap <silent> <c-g><c-i> :call CocAction('format')<cr>
nnoremap <silent> gd :call CocAction('jumpDefinition', 'tabe')<cr>
nnoremap <silent> gD :call CocAction('jumpReferences')<cr>
nnoremap <silent> K :call CocAction('doHover')<cr>
inoremap <silent><expr> <c-l> coc#refresh()

autocmd BufWritePre *.py :silent call CocAction('runCommand', 'python.sortImports')
