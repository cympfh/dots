" Plugins for colorscheme
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'tiagovla/tokyodark.nvim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'jacoborus/tender.vim'
Plug 'yasukotelin/shirotelin'
Plug 'sainnhe/edge'

function s:LoadColorSchemeSafely(name)
  try
    exec "colorscheme " . a:name
  catch /^Vim\%((\a\+)\)\=:E185/
    echo 'E185: Cannot find color scheme ' . a:name
  endtry
endfunction
command! -nargs=1 ColorScheme :call <sid>LoadColorSchemeSafely(<f-args>)
