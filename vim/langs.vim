" Completion with Dictionary
set complete+=k

" Support Tools
"
Plug 'sheerun/vim-polyglot'

" Linter
Plug 'dense-analysis/ale'

" Language Server
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
let g:asyncomplete_auto_popup = 0
let g:lsp_diagnostics_enabled = 0
let g:lsp_textprop_enabled = 0
let g:lsp_preview_float = 1
let g:lsp_documentation_float = 0
let g:lsp_hover_conceal = 0
let g:lsp_signature_help_enabled = 0
imap <c-o> <Plug>(asyncomplete_force_refresh)
nmap <buffer> K <plug>(lsp-hover)

" Emmet
let g:user_emmet_leader_key = '<c-g>'
let g:user_emmet_install_global = 0
let g:user_emmet_settings = { 'variables': { 'lang' : 'ja' } }
autocmd FileType html,css,markdown EmmetInstall
Plug 'mattn/emmet-vim'

""" Languages
"

" Default Terminal
nn <c-g><c-t> :terminal<cr>

" Makefile
setlocal expandtab
au FileType make,calendar setlocal noexpandtab

" Awk
au FileType awk nn <buffer> <leader>r :!awk -f %<cr>
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
Plug 'octol/vim-cpp-enhanced-highlight'
au FileType cpp set cindent
au FileType cpp set dictionary+=~/.dots/vim/dict/cpp
au FileType cpp nn <buffer> <leader>g :!g++ -O3 -o %:r.exe -std=c++17 %<cr>
au FileType cpp nn <buffer> <leader>r :!time ./%:r.exe<cr>
au FileType cpp nn <buffer> <leader>t :!time ./%:r.exe <input<cr>

" C++ Ale
au FileType cpp let g:ale_linters = {'cpp': ['gcc']}

" Calendar
au BufRead,BufNewFile *.calendar set filetype=calendar
au FileType calendar set noexpandtab

" Clojure
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
au BufRead,BufNewFile *.clj set filetype=clojure
au FileType clojure nn <buffer> <leader>r :!time clojure %<cr>
au FileType clojure nn <buffer> <leader>t :!time clojure % < ./input<cr>

" Common Lisp
au FileType lisp nn <buffer> <leader>r :!time clisp %<cr>

" Coq
Plug 'jvoorhis/coq.vim'
au BufRead,BufNewFile *.v set filetype=coq
au FileType coq nn <buffer> <leader>g :!time coqc %<cr>
au FileType coq nn <buffer> <leader>r :!time coqtop < % 2>/dev/null<cr>
au FileType coq nn <buffer> <c-g><c-t> :terminal coqtop<cr>
au FileType coq setlocal dictionary+=~/.dots/vim/dict/coq
au FileType coq set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" cumin
" Plug 'rust-lang/rust.vim'
au BufRead,BufNewFile *.cumin set filetype=cumin
au BufRead,BufNewFile *.cumin set syntax=rust
au FileType cumin set syntax=rust
au FileType cumin nn <leader>r :!cuminc %<cr>
au FileType cumin let b:caw_oneline_comment = '//'

" dc
au BufRead,BufNewFile *.dc set filetype=dc
Plug 'vim-scripts/dc.vim'
au FileType dc nn <buffer> <leader>r :!dc %<cr>
au FileType dc nn <buffer> <leader>t :!dc % < input<cr>

" Dot
au FileType dot ino <c-l> ->
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
Plug 'jnwhiteh/vim-golang'
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
au FileType gnuplot nn <buffer> <c-g><c-t> :terminal gnuplot<cr>
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
Plug 'kana/vim-filetype-haskell'
au FileType haskell ino <c-l> ->
au FileType haskell nn <buffer> <leader>g :!ghc -O3 ./% -o %:r.exe<cr>
au FileType haskell nn <buffer> <leader>r :!./%:r.exe<cr>
au FileType haskell nn <buffer> <leader>t :!./%:r.exe <input<cr>
au FileType haskell set dictionary+=~/.dots/vim/dict/haskell

" Hive
Plug 'autowitch/hive.vim'
au BufRead,BufNewFile *.hive set filetype=hive
au FileType hive nn <buffer> <leader>r :!time hive %<cr>
au FileType hive nn <buffer> <c-g><c-i> :call <sid>SQLFmt()<cr>

" HTML
au FileType html set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Hy
Plug 'cympfh/vim-hy'
au FileType hy nn <buffer> <leader>r :!time hy %<cr>
au FileType hy nn <buffer> <c-g><c-t> :terminal hy<cr>

" J
au BufRead,BufNewFile *.j  set filetype=j
au FileType j   nn <buffer> <leader>r :!j %<cr>

" JavaScript (Node.js) (ECMAScript)
Plug 'pangloss/vim-javascript'
au FileType javascript nn <buffer> <leader>r :!time node %<cr>
au FileType javascript nn <buffer> <leader>t :!node % <input<cr>
au FileType javascript set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Julia
Plug 'JuliaEditorSupport/julia-vim'
au BufRead,BufNewFile *.jl set filetype=julia
au FileType julia nn <buffer> <leader>r :!time julia %<cr>
au FileType julia nn <buffer> <leader>t :!time julia % <input<cr>
au FileType julia nn <buffer> <c-g><c-t> :terminal julia<cr>

" Jsonnet
Plug 'google/vim-jsonnet'

" Json5
Plug 'GutenYe/json5.vim'
au FileType json5 set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Kotlin
Plug 'udalov/kotlin-vim'
au BufRead,BufNewFile *.kt set filetype=kotlin
au FileType kotlin nn <buffer> <leader>g :!kotlinc % -include-runtime -d %:r.jar<cr>
au FileType kotlin nn <buffer> <leader>r :!time java -jar %:r.jar<cr>
au FileType kotlin nn <buffer> <leader>t :!time java -jar %:r.jar <input<cr>

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
au FileType tex nn <buffer> <leader>r :call <sid>open_pdf(expand('%:r') . '.pdf')<cr>

" Lua
au FileType lua nn <buffer> <leader>r :!time luajit %<cr>
au FileType lua nn <buffer> <leader>t :!time luajit % <input<cr>

" Markdown
au BufRead,BufNewFile *.md set filetype=markdown
let g:vim_markdown_math = 1
au FileType markdown so ~/.dots/vim/tex.vim
let g:table_mode_map_prefix = 'invalid'
au FileType markdown nn <buffer> <leader>t :TableModeToggle<cr>
Plug 'dhruvasagar/vim-table-mode'

" OCaml
au FileType ocaml nn <buffer> <leader>g :!ocamlopt -o %:r.exe str.cmxa %<cr>
au FileType ocaml nn <buffer> <leader>r :!time ./%:r.exe<cr>
au FileType ocaml nn <buffer> <leader>t :!time ./%:r.exe <input<cr>

" Perl6
Plug 'vim-perl/vim-perl6'
au BufRead,BufNewFile *.pl set filetype=perl6
au FileType perl6 nn <buffer> <leader>r :!time perl6 %<cr>
au FileType perl6 nn <buffer> <leader>t :!time perl6 % <input<cr>

" Prolog
au FileType prolog nn <buffer> <leader>r :!time swipl -q -O -g main -s %<cr>
au FileType prolog nn <buffer> <leader>t :!time swipl -q -O -g main -s % <input<cr>

" Python
" NOTE: DONT USE pyenv
let g:python_highlight_all = 1
au FileType python nn <buffer> <leader>r :!time python %<cr>
au FileType python nn <buffer> <leader>t :!time python % <input<cr>
au FileType python nn <buffer> <c-g><c-t> :terminal ipython --no-autoindent<cr>
au FileType python command! MyPyCheck :let g:ale_linters['python'] += ['mypy']
au FileType python nn <buffer> gd :LspDefinition<cr>

" Python Ale
au FileType python let g:ale_linters = {'python': ['flake8', 'pycodestyle', 'isort', 'pydocstyle']}
au FileType python let g:ale_python_pydocstyle_options = '--ignore=D100,D104,D203,D213,D4'

" Python Black, Isort
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'fisadev/vim-isort'
function! s:PythonFormatten()
    execute ':Isort'
    execute ':Black'
endfunction
au FileType python nn <c-g><c-i> :call <sid>PythonFormatten()<cr>

" Python Language Server
"" pip install python-language-server
if executable('pyls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python'],
    \ })
  au FileType python nn <buffer> K :LspHover<cr>
endif

" PlantUML
au BufRead,BufNewFile *.uml set filetype=plantuml

function! CompileUML()
  :!plantuml %
endfunction

function! OpenUML()
  if has('mac')
    :!open %:r.png
  else
    :!feh %:r.png
  endif
endfunction

au FileType plantuml nn <buffer> <leader>g :call CompileUML()<cr>
au FileType plantuml nn <buffer> <leader>r :call OpenUML()<cr>

" R
au FileType r nn <buffer> <leader>r :!time Rscript ./%<cr>

" Ruby
au FileType ruby nn <buffer> <leader>r :!time ruby %<cr>
au FileType ruby nn <buffer> <leader>t :!time ruby % <input<cr>
au FileType ruby nn <buffer> <c-g><c-t> :terminal irb<cr>
au FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
au FileType ruby let g:ale_enabled = 0

" Ruby solargraph
if executable('solargraph')
    " gem install solargraph
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
endif

" Rust
Plug 'rust-lang/rust.vim'
au BufRead,BufNewFile *.rs set filetype=rust
au FileType rust normal zM
if filereadable("Cargo.toml")
  let g:rust_cargo = 1
else
  let g:rust_cargo = 0
endif
function! CompileRust(optimize)
  if g:rust_cargo == 1
    if a:optimize == 0
      :!cargo build
    else
      :!cargo build --release
    endif
  else
    if a:optimize == 0
      :!rustc --edition 2018 -o %:r.exe %
    else
      :!rustc --edition 2018 -o %:r.exe -O %
    endif
  endif
endfunction
function! RunRust(k)
  if g:rust_cargo == 1
    if a:k == 0
      if expand("%") =~ "src/bin/.*.rs"
        let binname = matchlist(expand("%"), 'src/bin/\(.*\).rs')[1]
        exe ':!time cargo run --bin ' . binname
      else
        :!time cargo run
      endif
    else
      :!time cargo run < input
    endif
  elseif a:k == 0
    :!time ./%:r.exe
  else
    :!time ./%:r.exe < input
  endif
endfunction
au FileType rust nn <buffer> <leader>g :call CompileRust(0)<cr>
au FileType rust nn <buffer> <leader>G :call CompileRust(1)<cr>
au FileType rust nn <buffer> <leader>r :call RunRust(0)<cr>
au FileType rust nn <buffer> <leader>t :call RunRust(1)<cr>
au FileType rust nn <buffer> gd :LspDefinition<cr>
let g:rustfmt_autosave = 1
au FileType rust nn <buffer> <c-g><c-i> :RustFmt<cr>

" Rust Ale
" rustup component add rls rust-analysis rust-src rustfmt
if g:rust_cargo == 1
  au FileType rust let g:ale_linters = {'rust': ['analyzer']}
else
  au FileType rust let g:ale_linters = {'rust': ['rustc']}
endif
au FileType rust let g:ale_rust_rustc_options = '--edition 2018 '
au FileType rust let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

" Rust Language Server
if g:rust_cargo == 0 && executable('rls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'rls',
    \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
    \ 'whitelist': ['rust'],
    \ })
endif
au FileType rust nn K :LspHover<cr>

" Sed (sed)
au FileType sed nn <buffer> <leader>r :!sed -f % <cr>
au FileType sed nn <buffer> <leader>t :!sed -f % <input<cr>

" Scala
au BufRead,BufNewFile *.scala set filetype=scala
au FileType scala set makeprg=make
au FileType scala nn <buffer> <leader>r :!scala -feature -deprecation %<cr>
au FileType scala nn <buffer> <leader>t :!scala -feature -deprecation % <input<cr>
au FileType scala set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
au FileType sbt set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Scheme
au FileType scheme nn <buffer> <leader>r :!gosh -l ./%<cr>
au FileType scheme nn <buffer> <leader>t :!time gosh ./% <input<cr>

" SQL
function! s:SQLFmt()
  let pos = getpos('.')
  :%!sqlformat --reindent --keywords upper --identifiers lower -
  call setpos('.', pos)
endfunction
au FileType sql nn <buffer> <c-g><c-i> :call <sid>SQLFmt()<cr>

" TypeScript
au FileType typescript nn <buffer> <leader>r :!deno run -A %<cr>
au FileType typescript nn <buffer> <c-g><c-i> :Prettier<cr>

" YAML (yaml, yml) for ansible
au BufRead,BufNewFile *.yml set filetype=yaml.ansible
au FileType yaml.ansible set tabstop=2 shiftwidth=2 softtabstop=2

" Frontend Misc (svelte)
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'evanleck/vim-svelte', {'branch': 'main'}
au FileType svelte nn <buffer> <c-g><c-i> :Prettier<cr>
