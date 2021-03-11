bindkey -d
bindkey -v
bindkey '^[[Z' reverse-menu-complete

#
# cd
#
cd-up() {
    cd ..
    zle reset-prompt
}
zle -N cd-up
bindkey "^G^U" cd-up

cd-old() {
    cd -
    zle reset-prompt
}
zle -N cd-old
bindkey "^G^O" cd-old

cd-home() {
    cd
    zle reset-prompt
}
zle -N cd-home
bindkey "^G^H" cd-home

cd-recent() {
    CDPATH=$(cat ~/.zsh_pwd_history | tac | peco)
    [ ! -z "$CDPATH" ] && cd "$CDPATH"
    zle reset-prompt
}
zle -N cd-recent
bindkey "^G^R" cd-recent

#
# history
#
call-history() {
    TMP_BUFFER=$(history -n 1 | tac | peco --query "$BUFFER")
    if [ ! -z "$TMP_BUFFER" ]; then
        BUFFER=$TMP_BUFFER
        CURSOR=$#BUFFER
    fi
    zle reset-prompt
}
zle -N call-history
bindkey "^R" call-history

#
# screen
#
insert-screen-x() {
    BUFFER=screen-x
    CURSOR=$#BUFFER
    zle .accept-line
}
zle -N insert-screen-x
bindkey "^K^X" insert-screen-x

insert-screen-s() {
    BUFFER=screen-s
    CURSOR=$#BUFFER
    zle .accept-line
}
zle -N insert-screen-s
bindkey "^K^S" insert-screen-s

#
# git
#
checkout-branch() {
    TARGET=$(
        (
          echo "* new *"
          git branch --verbose
        ) | peco
    )
    if [ -z "$TARGET" ]; then
        ;
    elif [ "$TARGET" = "* new *" ]; then
        BUFFER="git checkout -b "
        CURSOR=$#BUFFER
    else
        branch=$(echo "$TARGET" | awk '{print $1}')
        if [ "$branch" != "*" ]; then
            echo git checkout "$branch"
            git checkout "$branch"
        fi
    fi
    zle reset-prompt
}
zle -N checkout-branch
bindkey "^G^G" checkout-branch

#
# k8s
#
checkout-k8s-context() {
  SELECTED=$(kubectl config get-contexts | peco | awk '{print $1}')
  case "$SELECTED" in
    CURRENT )
      echo "???"
      ;;
    "*" )
      echo "Hmm"
      ;;
    "" )
      echo "Canceled"
      ;;
    * )
      kubectl config use-context "$SELECTED"
      ;;
  esac
}
zle -N checkout-k8s-context
bindkey "^Gk" checkout-k8s-context
