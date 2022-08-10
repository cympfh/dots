Plug 'vim-skk/skkeleton'

imap <C-j> <Plug>(skkeleton-toggle)

function! s:skkeleton_init() abort
  call skkeleton#config({
        \ 'globalJisyo': '~/.skk/SKK-JISYO.L',
        \ 'userJisyo': '~/Dropbox/skk/skkeleton',
        \ 'eggLikeNewline': v:false,
        \ 'keepState': v:true,
        \ })
  call skkeleton#register_kanatable('rom', {
        \ ",": [","],
        \ ".": ["."],
        \ })
endfunction
augroup skkeleton-initialize-pre
  autocmd!
  autocmd User skkeleton-initialize-pre call s:skkeleton_init()
augroup END
