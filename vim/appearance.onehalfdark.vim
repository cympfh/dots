Plugin 'sonph/onehalf', {'rtp': 'vim/'}
try
    colorscheme onehalfdark
catch /^Vim\%((\a\+)\)\=:E185/
    echo 'Not found colorscheme zenburn'
endtry
syntax on
