#!/bin/bash

case $( uname -s ) in

  Linux )
    alias l='ls --color'
    alias ls='ls --color'
    alias ll='ls -lh --color'
    alias mplayer='mplayer -vo x11 -zoom -af scaletempo -speed 1.05'
    alias z='zathura'
    alias mozc-tool='/usr/lib/mozc/mozc_tool --mode=config_dialog'
    ;;

  * )
    alias l='ls -G'
    alias ls='ls -G'
    alias ll='ls -lh -G'
    ;;

esac

alias u='cd ..'
alias g='git'

alias chmox='chmod +x'
alias screen='ssh-agent screen'

function mkcd() {
  mkdir "$1" && cd "$1"
}

# alias vi='vim --servername A'
