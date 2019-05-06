#!/bin/bash

fuck() { 
    if [ $# -eq 0 ]; then
        COM=$(cat <<EOM | peco --prompt "fuck "
ssh-agent
kill -9
docker containers
docker images
fan
EOM
)
    else
        COM=$1
    fi

    case "$COM" in
        ssh | "ssh-agent" )
            fuck-ssh
            ;;
        kill | "kill -9" )
            fuck-kill
            ;;
        docker-containers | "docker containers" )
            fuck-docker-containers
            ;;
        docker-images | "docker images" )
            fuck-docker-images
            ;;
        fan )
            fuck-fan
            ;;
        * )
            ;;
    esac
}

# fuck the ssh
if [ -f ~/.ssh/auth.sock ]; then
    SSH_AUTH_SOCK=$(cat ~/.ssh/auth.sock)
else
    echo NO SSH_AUTH_SOCK FOUND
fi
function fuck-ssh() {
  eval $(ssh-agent)
  ssh-add ~/.ssh/id_rsa
  echo $SSH_AUTH_SOCK > ~/.ssh/auth.sock
}

fuck-kill() {
    ps aux | peco | awk '{print "kill -9", $2}' | sh
}

# fuck the docker
fuck-docker-containers() {
    docker ps -a | awk 'NR>1' | peco | awk '{print "docker stop",$1,"&& docker rm",$1 }' | sh
}
fuck-docker-images() {
    docker images | awk 'NR>1' | peco | awk '{print "docker rmi",$3 }' | sh
}

fuck-fan() {
    PERCENT=$(cat <<EOM | peco
10
20
30
40
50
60
70
80
90
EOM
)
    if [ ! -z "$PERCENT" ]; then
        sudo fancontrol $PERCENT
    fi
}

_call_fuck() {
    tmp=$DISPLAY
    unset DISPLAY
    fuck
    export DISPLAY=$tmp
    zle reset-prompt
}
zle -N _call_fuck
bindkey "^F" _call_fuck
