#!/bin/bash

fuck() {

    if [ $# -eq 0 ]; then
        COM=$(cat <<EOM | peco --prompt "fuck "
ssh-agent
kill -9
docker containers
docker images
python
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
        python )
            fuck-python
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

fuck-python() {
    pyenv-init
}

alias f=fuck
