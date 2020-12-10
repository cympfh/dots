Plugin 'sonph/onehalf', {'rtp': 'vim/'}
try
    colorscheme onehalfdark
catch /^Vim\%((\a\+)\)\=:E185/
    echo 'Not found colorscheme onehalfdark'
endtry
syntax on
