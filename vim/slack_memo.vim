let g:slack_memo_token = $SLACK_ELIZA_TOKEN
let g:slack_memo_channel = $SLACK_DOSOKU_CHANNEL_MEMO
Plug 'mattn/webapi-vim'
Plug 'cympfh/slack-memo-vim'
nnoremap <c-s><c-l> :SlackMemoList<cr>
nnoremap <c-s><c-p> :SlackMemoPost<cr>
nnoremap <c-s><c-s> :SlackMemoSearch 
