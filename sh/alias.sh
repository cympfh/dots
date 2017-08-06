#!/bin/bash

case $( uname -s ) in

  Linux )
    alias l='ls --color'
    alias ls='ls --color'
    alias ll='ls -lh --color'
    alias mplayer='mplayer -vo x11 -zoom -af scaletempo -speed 1.05 -correct-pts'
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

alias :e='vim'
alias :q='exit'
alias :wq='exit'

function mkcd {
  mkdir "$1" && cd "$1"
}

function id3pic {
  eyeD3 --add-image=$1:FRONT_COVER $2
}

function fehbg {
  feh --bg-fill `find $PWD/* | shuf | tail -1`
}

function sprunge {
    curl -F "sprunge=<-" http://sprunge.us
}

function clbin {
    curl -F 'clbin=<-' https://clbin.com
}
function clbin-img {
    curl -F "clbin=@$1" https://clbin.com
}

# fuck the ssh
function fuck {
  eval $(ssh-agent)
  ssh-add ~/.ssh/id_rsa
}

# kill the processes (pgrep)
function kiru {
    ps aux | grep "$1" | grep -v grep | awk '{print "kill -9", $2}'
}

# kill the docker
function kiru-containers() {
    docker ps -f status=exited | awk 'NR>1{print "docker rm",$1 }'
}

function kiru-images() {
   docker images | grep '<none>' | awk '{print "docker rmi", $3}'
}
