Plugin 'jnurmine/Zenburn'
try
    let g:zenburn_transparent = 1
    colorscheme zenburn
catch /^Vim\%((\a\+)\)\=:E185/
    echo 'Not found colorscheme zenburn'
endtry
syntax on
