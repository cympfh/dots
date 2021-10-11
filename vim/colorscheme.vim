" Plugins for colorscheme

Plug 'sonph/onehalf', {'rtp': 'vim/'}

function s:LoadColorSchemeSafely(name)
  try
    exec "colorscheme " . a:name
  catch /^Vim\%((\a\+)\)\=:E185/
    echo 'E185: Cannot find color scheme ' . a:name
  endtry
endfunction
command! -nargs=1 ColorScheme :call <sid>LoadColorSchemeSafely(<f-args>)

Plug 'tiagovla/tokyodark.nvim'

Plug 'ghifarit53/tokyonight-vim'
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
