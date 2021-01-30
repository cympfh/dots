set laststatus=2

let &stl=""
let &stl.="%f %m%r%h%w%y"  " filename modified readonly help write filetype
let &stl.="%="  " padding
" let &stl.=" [%{&fenc!=''?&fenc:&enc}]"
" let &stl.=" [%{&fileformat}]"
let &stl.=" L%l:%c"
