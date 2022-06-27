Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [
      \'coc-pyright',
      \'coc-rust-analyzer',
      \'coc-translator',
      \'coc-go',
      \'@yaegassy/coc-nginx',
      \'coc-svelte',
      \]

nnoremap <silent> <c-g><c-i> :call CocAction('format')<cr>
nnoremap <silent> gd :call CocAction('jumpDefinition', 'tabe')<cr>
nnoremap <silent> gD :call CocAction('jumpReferences')<cr>
nnoremap <silent> K :call CocAction('doHover')<cr>

autocmd BufWritePre *.py :silent call CocAction('runCommand', 'python.sortImports')
