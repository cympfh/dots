Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [
      \'coc-pyright',
      \'coc-rust-analyzer',
      \]

nnoremap <silent> gd :call CocAction('jumpDefinition', 'tabe')<cr>
nnoremap <silent> K :call CocAction('doHover')<cr>
inoremap <silent><expr> <c-l> coc#refresh()
autocmd BufWritePre *.py :silent call CocAction('runCommand', 'python.sortImports')
autocmd BufWritePre *.rs :silent RustFmt

" jump.vim
function! s:jump_context()
  if len(getqflist()) > 0 " Quickfix List
    let g:copend = 1
    copen
    return 0
  else
    let g:copend = 0
    cclose
    return 1
  end
endfunction

function! s:jump_next()
  let ctx = s:jump_context()
  if ctx == 0
    cnext
  elseif ctx == 1
    call CocActionAsync('diagnosticNext')
  else
    echo "Nothing to do"
  end
endfunction

function! s:jump_prev()
  let ctx = s:jump_context()
  if ctx == 0
    cprev
  elseif ctx == 1
    call CocActionAsync('diagnosticPrevious')
  else
    echo "Nothing to do"
  end
endfunction

nmap <silent> <c-g><c-n> :call <sid>jump_next()<cr>
nmap <silent> <c-g><c-p> :call <sid>jump_prev()<cr>

" inlayHints のトグル
if !exists('g:inlay_hints')
  let g:inlay_hints = 0  " 初期値は off
endif

let s:inlay_keys = [
      \ 'pyright.inlayHints.parameterTypes',
      \ 'pyright.inlayHints.variableTypes',
      \ 'rust-analyzer.inlayHints.typeHints.enable',
      \ 'rust-analyzer.inlayHints.typeHints.hideClosureParameter',
      \ 'rust-analyzer.inlayHints.parameterHints',
      \ ]

function! ToggleRustInlayHints() abort
  if g:inlay_hints
    for key in s:inlay_keys
      call coc#config(key, v:false)
    endfor
    let g:inlay_hints = 0
    echo "Inlay hints disabled"
  else
    for key in s:inlay_keys
      call coc#config(key, v:true)
    endfor
    let g:inlay_hints = 1
    echo "Inlay hints enabled"
  endif
endfunction

nnoremap <silent> <c-g>i :call ToggleRustInlayHints()<cr>
