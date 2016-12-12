set laststatus=2
let &stl="%<%f %m%r%h%w%y%="

let &stl.="%#warningmsg#"
let &stl.="%{SyntasticStatuslineFlag()}"
let &stl.="%*"

let &stl.=" %{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}"
let &stl.=" %l/%L:%c"
