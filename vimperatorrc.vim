set titlestring=Firefox
set nohlsearch
set defsearch=google
set gui=none,tabs,navigation
set statuslinevisibility=visible  # visible also in fullscreen

source ~/.dots/vimperator/keymap.vim
source ~/.dots/vimperator/colorscheme.vim
source ~/.dots/vimperator/imageextender.js
source ~/.dots/vimperator/misc.vim

js services.services.autoCompleteSearch.class_="@mozilla.org/autocomplete/search;1?name=unifiedcomplete"
