
" Copy Title + URL by markdown method
nnoremap yt :js util.copyToClipboard(buffer.title + ' ' + buffer.URL)<cr>
nnoremap ym :js util.copyToClipboard('[' + buffer.title + '](' + buffer.URL + ')')<cr>
