FUCK_FILE_PATH=$0

fuck() {
  COM=$(
    cat $FUCK_FILE_PATH | awk '
      function padding(n) {
        if (n<1) return "";
        return " " padding(n-1);
      }
      /^fuck-.*()/{print $1, padding(32 - length($1)), LAST}
      {LAST=$0}
    ' |
      sed 's/^fuck-//; s/()//' |
      peco --prompt "fuck"
  )
  COM=$(echo $COM | sed 's/ .*//g')
  if ( type "fuck-$COM" > /dev/null ); then
    fuck-$COM
  else
    :
  fi
}

if [ -f ~/.ssh/auth.sock ]; then
  export SSH_AUTH_SOCK=$(cat ~/.ssh/auth.sock)
else
  echo NO SSH_AUTH_SOCK FOUND
fi

# ssh-agent
fuck-ssh() {
  eval $(ssh-agent)
  ssh-add ~/.ssh/id_rsa
  echo $SSH_AUTH_SOCK > ~/.ssh/auth.sock
}

# kill -9
fuck-kill() {
  ps aux | peco | awk '{print "kill -9", $2}' | sh
}

# fire docker containers
fuck-docker-containers() {
  docker ps -a | awk 'NR>1' | peco | awk '{print "docker stop",$1,"&& docker rm",$1 }' | sh
}

# fire docker images
fuck-docker-images() {
  docker images | awk 'NR>1' | peco | awk '{print "docker rmi",$3 }' | sh
}

# remove pycache/ recursively
fuck-pycache() {
  find . -type d | grep pycache | sed 's/.*/rm -r &/g' | sh
}

# set by hwclock
fuck-hwclock() {
  sudo hwclock -s
}

# Left-Ctrl -> Caps
fuck-caps() {
  DISPLAY=:0.0 setxkbmap -layout us -option ctrl:nocaps
}

# Caps is Caps
fuck-caps-caps() {
  DISPLAY=:0.0 setxkbmap -layout us -option
}

# delete branch (from local and origin)
fuck-git-branch() {
  BRANCH=$(
    git branch --verbose |
      peco |
      awk '{print $1}'
  )
  if [ -z "$BRANCH" ]; then
    ;
  else
    git branch -D $BRANCH
    git push origin :$BRANCH
  fi
}

_call_fuck() {
  TMP_DISPLAY=$DISPLAY
  unset DISPLAY
  fuck
  export DISPLAY=$TMP_DISPLAY
  zle reset-prompt
}
zle -N _call_fuck
bindkey "^F" _call_fuck
