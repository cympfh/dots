set background=dark
Plugin 'jeffkreeftmeijer/vim-dim'
try
    colorscheme dim
catch /^Vim\%((\a\+)\)\=:E185/
    echo 'Not found colorscheme dim'
    " deal with it
endtry
syntax on
