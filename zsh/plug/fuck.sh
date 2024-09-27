FUCK_FILE_PATH=$0

fuck() {
  QUERY="$1"
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
      sort |
      peco --prompt "fuck" --query "$QUERY"
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

# Set git config --local user.name and user.email
fuck-git-username() {
  GITF=$( ls -1 ~/.dots/git/users/*.git | sed 's#.*/##' | peco --prompt "Who are you? >" )
  eval $( cat ~/.dots/git/users/$GITF | grep '=' | awk '/name/ || /email/' | sed 's/^ */FUCK_GIT_/; s/ *= */=/' )
  git config --local user.name "$FUCK_GIT_name"
  git config --local user.email "$FUCK_GIT_email"
}

# remove a branch (from LOCAL)
fuck-git-branch-delete() {
  BRANCH=$(
    git branch --verbose |
      peco |
      awk '{print $1}'
  )
  if [ -z "$BRANCH" ]; then
    echo cancel
  else
    git branch -D "$BRANCH"
    # git push origin ":$BRANCH"
  fi
}

# create a new branch
fuck-git-branch-new() {
  BUFFER="git checkout -b "
  CURSOR=$#BUFFER
}

# goto main (master) branch
fuck-git-branch-main() {
  if ( git branch | grep ' main$' >/dev/null 2>&1 ); then
    git checkout main
  else
    git checkout master
  fi
}

# checkout a branch
fuck-git-branch-checkout() {
  BRANCH=$(
    git branch --verbose |
      peco |
      awk '{print $1}'
  )
  if [ "_$BRANCH" = "_*" ]; then
    echo you are on there
  elif [ -z "$BRANCH" ]; then
    echo cancel
  else
    git checkout "$BRANCH"
  fi
}

# aws-screen DEV
fuck-aws-screen-dev() {
  aws-screen-dev
}

# aws-screen PROD
fuck-aws-screen-prod() {
  aws-screen-prod
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
