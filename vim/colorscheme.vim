Plug 'jeffkreeftmeijer/vim-dim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'jnurmine/Zenburn', {'rtp': 'vim/'}

function s:LoadColorSchemeSafely(name)
  try
    exec "colorscheme " . a:name
  catch /^Vim\%((\a\+)\)\=:E185/
    echo 'E185: Cannot find color scheme ' . a:name
  endtry
endfunction
command! -nargs=1 ColorScheme :call <SID>LoadColorSchemeSafely(<f-args>)
