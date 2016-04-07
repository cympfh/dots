let g:markdown_fenced_languages = [
\ 'css',
\ 'javascript',
\ 'js=javascript',
\ 'json=javascript',
\ 'coffee',
\ 'haskell',
\ 'ocaml',
\ 'sh',
\ 'bash=sh',
\ 'python',
\ 'cpp'
\]

" cursor
"
set cursorline
nn <leader>c :set cursorcolumn!<cr>

" indent
"
Bundle "Yggdroot/indentLine"
let g:indentLine_color_term = 239
let g:indentLine_char = "'"

" status bar
"
set laststatus=2

let &stl="%<%f %m%r%h%w%y%="
let &stl.=" %{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}"
let &stl.=" %l/%L"

let g:n_sl = 'hi StatusLine cterm=bold,underline ctermbg=none ctermfg=25'
let g:i_sl = 'hi StatusLine cterm=bold,underline ctermbg=none ctermfg=27'

au InsertEnter * call <SID>StatusLine(0)
au InsertLeave * call <SID>StatusLine(1)

fun! s:StatusLine(mode)
  if a:mode == 0
    silent exec g:i_sl
  else
    silent exec g:n_sl
  endif
endfun

colorscheme slate

syntax on

hi Statement cterm=bold ctermfg=127
hi Comment   ctermfg=2:0
" hi Type cterm=bold ctermfg=127
hi String cterm=bold ctermfg=45

" 
hi htmlH1 cterm=bold,underline ctermfg=40
hi htmlH2 cterm=bold ctermfg=31
hi htmlH3 cterm=bold ctermfg=110

hi SpellBad     cterm=underline ctermbg=black ctermfg=red
hi Typedef      cterm=NONE ctermfg=30

hi LineNr    cterm=NONE ctermfg=lightgray
hi CursorLineNr    cterm=NONE ctermfg=red

set colorcolumn=80
hi ColorColumn ctermbg=8

silent exec g:n_sl
