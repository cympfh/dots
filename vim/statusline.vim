set laststatus=2
let &stl="%<%f %m%r%h%w%y"  " filename modified readonly help write filetype

let &stl.="%="  " padding

let &stl.=" [Error: %{ale#statusline#Count(bufnr(''))['error']}]"
let &stl.=" [Warn: %{ale#statusline#Count(bufnr(''))['warning']}]"

let &stl.=" [%{&fenc!=''?&fenc:&enc}]"
let &stl.=" [%{&fileformat}]"
let &stl.=" %l/%L:%c"
