" Makefile
setlocal expandtab
au FileType make,calendar setlocal noexpandtab

" Awk
au FileType awk nn <buffer> <leader>t :!awk -f % ./input<cr>

" Bash (Shell)
au FileType sh nn <buffer><silent> <leader>r :!bash %<cr>
au FileType sh nn <buffer><silent> <leader>t :!bash % <input<cr>

" Brainfuck
au BufRead,BufNewFile *.bf set filetype=brainfuck
au FileType brainfuck nn <buffer><silent> <leader>r :!bf %<cr>

" C
au FileType c set cindent
au FileType c nn <buffer> <leader>g :!gcc -o %:r.exe %<cr>
au FileType c nn <buffer> <leader>r :!time ./%:r.exe<cr>
au FileType c nn <buffer> <leader>t :!time ./%:r.exe < ./input<cr>

" C++
Bundle 'octol/vim-cpp-enhanced-highlight'
if has('mac')
  let g:syntastic_cpp_compiler = 'g++'
  let g:syntastic_cpp_compiler_options = ' -std=c++11 '
else
  let g:syntastic_cpp_compiler_options = ' -std=c++11 '
endif
au FileType cpp set cindent
au FileType cpp set dictionary+=~/.dots/vim/dict/cpp
au FileType cpp nn <buffer> <leader>g :!g++ -O3 -o %:r.exe -std=c++11 %<cr>
au FileType cpp nn <buffer> <leader>r :!time ./%:r.exe<cr>
au FileType cpp nn <buffer> <leader>t :!time ./%:r.exe <input<cr>
au FileType cpp nm <buffer> <leader><leader>r <leader>g<leader>r
au FileType cpp nm <buffer> <leader><leader>t <leader>g<leader>t

" Clojure
Bundle 'tpope/vim-fireplace'
Bundle 'guns/vim-clojure-static'
Bundle 'guns/vim-clojure-highlight'
au BufRead,BufNewFile *.clj set filetype=clojure
au FileType clojure nn <buffer> <leader>r :!time clojure %<cr>
au FileType clojure nn <buffer> <leader>t :!time clojure % < ./input<cr>

" Coffee
Bundle 'kchmck/vim-coffee-script'
au BufRead,BufNewFile *.coffee set filetype=coffee
let g:syntastic_coffee_checkers = ['coffee']
au FileType coffee set makeprg=make
au FileType coffee ino <C-l> ->
au FileType coffee nn <buffer> <leader>r :!time coffee %<cr>
au FileType coffee nn <buffer> <leader>t :!time coffee % <input<cr>

" Common Lisp
au FileType lisp nn <buffer> <leader>r :!time clisp %<cr>

" Dot
au FileType dot ino <C-l> ->
au FileType dot set dictionary+=~/.dots/vim/dict/dot

function! CompileDot()
  if getline(1) =~ "blockdiag"
    :!blockdiag -Tsvg % > %:r.svg
  else
    :!dot -Tpng % > %:r.png
  endif
endfunction

function! OpenDot()
  if getline(1) =~ "blockdiag"
    if has('mac')
      :!open %:r.svg
    else
      :!display %:r.svg
    endif
  else
    if has('mac')
      :!open %:r.png
    else
      :!feh %:r.png
    endif
  endif
endfunction

au FileType dot nn <buffer> <leader>g :call CompileDot()<cr>
au FileType dot nn <buffer> <leader>r :call OpenDot()<cr>

" F#
au BufRead,BufNewFile *.fs set filetype=fsharp

" Go
Bundle 'jnwhiteh/vim-golang'
let g:gofmt_command = "gofmt -tabs=false -tabwidth=2"
set runtimepath+=$GOROOT/misc/vim
exe "set rtp+=" . globpath($GOPATH, "src/github.com/nsf/gocode/vim")
au BufRead,BufNewFile *.go set filetype=go
au BufWritePost *.go :Fmt
" au FileType go autocmd BufNewFile <buffer> Fmt
au FileType go set completeopt=menu,preview
au FileType go nn <buffer> <leader>g :!go build -o %:r.exe %<cr>
au FileType go nn <buffer> <leader>r :!./%:r.exe<cr>

" Gnuplot
au BufRead,BufNewFile *.gp set filetype=gnuplot
au BufRead,BufNewFile *.plt set filetype=gnuplot
au FileType gnuplot nn <buffer> <leader>g :!gnuplot %<cr>
fun! OpenGPImage()
  let f=system("cat ".expand("%")."|grep output|awk '{print $3}'|tr -d '\"'|tr -d \"'\"")
  if has('mac')
    exec ":!open " . f
  else
    exec ":!feh " . f
  endif
endfun
au FileType gnuplot nn <buffer> <leader>r :call OpenGPImage()<cr>


" Haskell
Bundle 'kana/vim-filetype-haskell'
au FileType haskell ino <C-l> ->
au FileType haskell nn <buffer> <leader>g :!ghc -O3 ./% -o %:r.exe<cr>
au FileType haskell nn <buffer> <leader>r :!./%:r.exe<cr>
au FileType haskell nn <buffer> <leader>t :!./%:r.exe <input<cr>
au FileType haskell nn <buffer> <leader><leader>r :!ghc -O3 ./% -o %:r.exe; ./%:r.exe<cr>
au FileType haskell nn <buffer> <leader><leader>t :!ghc -O3 ./% -o %:r.exe; ./%:r.exe <input<cr>
au FileType haskell set dictionary+=~/.dots/vim/dict/haskell

" Hot Cocoa Lisp
au BufRead,BufNewFile *.hcl set filetype=hcl
au FileType hcl nn <buffer> <leader>r :!hcl -nu %<cr>

" J
au BufRead,BufNewFile *.j  set filetype=j
au FileType j   nn <buffer> <leader>r :!j %<cr>

" JavaScript (Node.js) (ECMAScript)
Bundle 'pangloss/vim-javascript'
let g:syntastic_javascript_checkers = ['jslint']
let g:syntastic_javascript_jslint_args = '--stupid --sloppy --browser --devel --forin --node --vars --indent=2 --plusplus'
au FileType javascript ino <c-f> function
au FileType javascript nn <buffer> <leader>r :!time node %<cr>
au FileType javascript nn <buffer> <leader>h :!time node --use-strict --harmony %<cr>
au FileType javascript nn <buffer> <leader>t :!node % <input<cr>

" Julia
Bundle 'JuliaLang/julia-vim'
au BufRead,BufNewFile *.jl set filetype=julia
au FileType julia nn <buffer> <leader>r :!time julia %<cr>
au FileType julia nn <buffer> <leader>t :!time julia % <input<cr>

" Kotlin
Bundle 'udalov/kotlin-vim'
au BufRead,BufNewFile *.kt set filetype=kotlin

" LaTeX (latex)
" Bundle 'vim-latex/vim-latex'
let g:tex_conceal = ''
au BufRead,BufNewFile *.tex set filetype=tex
au FileType tex set makeprg=make
au FileType tex so ~/.dots/vim/tex.vim
au FileType tex nn <buffer> <leader>g :!platex % && dvipdfmx %:r.dvi<cr>
fun! s:open_pdf(name)
  if has('mac')
    let opener = 'open'
  else
    let opener = 'zathura'
  endif
  exe "!" . opener . ' ' . a:name . ' &'
endfun
au FileType tex nn <buffer> <leader>r :call <SID>open_pdf(expand('%:r') . '.pdf')<cr>

" Lua
au FileType lua nn <buffer> <leader>r :!time luajit %<cr>
au FileType lua nn <buffer> <leader>t :!time luajit % <input<cr>

" Markdown
au BufRead,BufNewFile *.md set filetype=markdown
let g:markdown_fenced_languages = [
\ 'css',
\ 'javascript',
\ 'js=javascript',
\ 'json=javascript',
\ 'coffee',
\ 'haskell',
\ 'ocaml',
\ 'sh',
\ 'bash=sh',
\ 'python',
\ 'cpp'
\]
let g:vim_markdown_math=1
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'kannokanno/previm'
Bundle 'tyru/open-browser.vim'
au FileType markdown so ~/.dots/vim/tex.vim

" OCaml
au FileType ocaml nn <buffer> <leader>g :!ocamlopt -o %:r.exe str.cmxa %<cr>
au FileType ocaml nn <buffer> <leader>r :!time ./%:r.exe<cr>
au FileType ocaml nn <buffer> <leader>t :!time ./%:r.exe <input<cr>

" Pig (pig)
au BufRead,BufNewFile *.pig set filetype=pig
Bundle "vim-scripts/pig.vim"

" Python (pyenv is recommended)
" Bundle 'hdima/python-syntax'
let g:syntastic_python_checkers = ['flake8']
au FileType python nn <buffer> <leader>r :!time python %<cr>
au FileType python nn <buffer> <leader>t :!time python % <input<cr>


" R
au FileType r nn <buffer> <leader>r :!time Rscript ./%<cr>

" Ruby
au FileType ruby nn <buffer> <leader>r :!time ruby ./%<cr>
au FileType ruby nn <buffer> <leader>t :!time ruby ./% <input<cr>

" Rust
" Bundle "wting/rust.vim"
Bundle 'rust-lang/rust.vim'
au BufRead,BufNewFile *.rs set filetype=rust
au FileType rust ino <C-l> ->
function! CompileRust()
  if expand('%') == 'src/main.rs'
    :!cargo build
  else
    :!rustc -o %:r.exe %
  endif
endfunction
function! RunRust(k)
  if expand('%') == 'src/main.rs'
    :!time cargo run
  elseif a:k == 0
    :!time ./%:r.exe
  else
    :!time ./%:r.exe < ./input
  endif
endfunction
function! BothRust()
  call CompileRust()
  call RunRust()
endfunction
au FileType rust nn <buffer> <leader>g :call CompileRust()<cr>
au FileType rust nn <buffer> <leader>r :call RunRust(0)<cr>
au FileType rust nn <buffer> <leader>t :call RunRust(1)<cr>
au FileType rust nn <buffer> <leader><leader>r :call BothRust()<cr>

" Scala
Bundle 'derekwyatt/vim-scala'
let g:syntastic_scala_checkers = ['fsc']
au BufRead,BufNewFile *.scala set filetype=scala
au FileType scala set makeprg=make
au FileType scala nn <buffer> <leader>r :!scala -feature -deprecation %<cr>
au FileType scala nn <buffer> <leader>t :!scala -feature -deprecation % <input<cr>

" Scheme
au FileType scheme nn <buffer> <leader>r :!rlwrap gosh -l ./%<cr>
au FileType scheme nn <buffer> <leader>t :!rlwrap gosh ./% <input<cr>

" TypeScript
Bundle 'leafgarland/typescript-vim'

" YAML (yaml, yml)
au FileType yaml set tabstop=2 shiftwidth=2 softtabstop=2
