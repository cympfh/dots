set laststatus=2
let &stl="%<%f %m%r%h%w%y%="
let &stl.=" %{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}"
let &stl.=" %l/%L:%c"
