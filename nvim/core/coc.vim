Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [
      \'coc-pyright',
      \'coc-rust-analyzer',
      \'coc-markdownlint',
      \'coc-translator'
      \]

nnoremap <silent> <c-g><c-i> :call CocAction('format')<cr>
nnoremap <silent> gd :call CocAction('jumpDefinition', 'tabe')<cr>
nnoremap <silent> gD :call CocAction('jumpReferences')<cr>
nnoremap <silent> K :call CocAction('doHover')<cr>
nmap <silent> L <Plug>(coc-translator-p)
