FUCK_FILE_PATH=$0

fuck() {
  COM=$(
    cat $FUCK_FILE_PATH | awk '
      function padding(n) {
        if (n<1) return "";
        return " " padding(n-1);
      }
      /^fuck-.*/{print $1, padding(32 - length($1)), LAST}
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
  for f in $(find ~/.ssh -name id_rsa); do ssh-add $f; done
  for f in $(find ~/.ssh -name id_ed25519); do ssh-add $f; done
  echo $SSH_AUTH_SOCK > ~/.ssh/auth.sock
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

# Append Dropbox/share/etc_hosts (for WSL)
fuck-etc-hosts() {
  cat /etc/hosts ~/Dropbox/share/etc_hosts |
    sort |
    uniq |
    sudo tee /etc/hosts
}

# Set git user.name locally
fuck-git-username() {
  GITF=$( ls -1 ~/.dots/git/users/*.git | sed 's#.*/##' | peco --prompt "Who are you? >" )
  eval $( cat ~/.dots/git/users/$GITF | grep '=' | awk '/name/ || /email/' | sed 's/^ */FUCK_GIT_/; s/ *= */=/' )
  git config --local user.name "$FUCK_GIT_name"
  git config --local user.email "$FUCK_GIT_email"
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
