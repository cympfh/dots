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

" status bar
"
set laststatus=2

let &stl="%<%f %m%r%h%w%y%="
let &stl.=" %{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}"
let &stl.=" %l/%L"

let g:n_sl = 'hi StatusLine cterm=bold,underline ctermbg=none ctermfg=lightyellow'
let g:i_sl = 'hi StatusLine cterm=bold,underline ctermbg=none ctermfg=226'

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

hi ColorColumn   ctermbg=8
hi Comment       ctermfg=220
hi Constant      ctermfg=3
hi CursorLineNr  cterm=NONE ctermfg=red
hi Function      ctermfg=3
hi LineNr        cterm=NONE ctermfg=lightgray
hi SpellBad      cterm=underline ctermbg=black ctermfg=red
hi Statement     cterm=bold ctermfg=6
hi String        cterm=bold ctermfg=45
hi Typedef       cterm=NONE ctermfg=39
hi htmlH1        cterm=bold,underline ctermfg=1
hi htmlH2        cterm=bold ctermfg=1
hi htmlH3        cterm=NONE ctermfg=1
hi htmlLink      cterm=NONE ctermfg=213
hi Special       cterm=NONE ctermfg=184 " TeX の数式モード

set colorcolumn=80
silent exec g:n_sl
