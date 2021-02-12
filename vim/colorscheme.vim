Plug 'sonph/onehalf', {'rtp': 'vim/'}

function s:LoadColorSchemeSafely(name)
  try
    exec "colorscheme " . a:name
  catch /^Vim\%((\a\+)\)\=:E185/
    echo 'E185: Cannot find color scheme ' . a:name
  endtry
endfunction
command! -nargs=1 ColorScheme :call <sid>LoadColorSchemeSafely(<f-args>)
