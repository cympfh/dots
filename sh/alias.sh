#!/bin/bash

case $( uname -s ) in

  Linux )
    alias l='ls --color'
    alias ls='ls --color'
    alias ll='ls -lh --color'
    alias mplayer='mplayer -vo x11 -zoom -af scaletempo -speed 1.05 -correct-pts'
    alias mozc-tool='/usr/lib/mozc/mozc_tool --mode=config_dialog'
    ;;

  * )
    alias l='ls -G'
    alias ls='ls -G'
    alias ll='ls -lh -G'
    ;;

esac

alias g='git'
alias vi='vim'

atmark() {
  find "$@" 2>/dev/null |
    grep -v ".git/" |
    grep -v "__pycache__" |
    peco
}
alias -g @='$( atmark . )'
alias -g @~='$( atmark ~ )'
alias -g @d='$( atmark . -type d )'
alias -g @f='$( atmark . -type f )'

function mkcd {
  mkdir "$1" && cd "$1"
}

function fehbg {
  feh --bg-fill `find $PWD/* | shuf | tail -1`
}

function json-keys() {
     jq -r '[path(..)|map(if type=="number" then "[]" else tostring end)|join(".")|split(".[]")|join("[]")]|unique|map("."+.)|.[]'
 }
