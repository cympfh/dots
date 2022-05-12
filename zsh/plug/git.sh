git-config-user() {
    git config --local user.name "$1"
    git config --local user.email "$2"
}

git-config-cympfh() {
    git-config-user cympfh cympfh@gmail.com
}

git-config-khattori() {
  git-config-user khattori kazuhiro_hattori@dwango.co.jp
}

checkout-branch() {
    if ! ( git status 2>/dev/null 1>&2 ); then
        echo "You are not on Git"
        zle reset-prompt
        return
    fi
    COMMAND=$(
        (
          echo "💧 newbranch"
          git branch --verbose | sed 's/^[ *]*/🌿 checkout - /'
          git branch --verbose | grep -v main | grep -v master | sed 's/^[ *]*/🔥 remove - /'
        ) | fzf --reverse --no-sort
    )
    OP="$( echo "$COMMAND" | awk '{print $2}' )"
    BR="$( echo "$COMMAND" | awk '{print $4}' )"
    if [ -z "$COMMAND" ]; then
        ;
    elif [ "$OP" = "newbranch" ]; then
        BUFFER="git checkout -b "
        CURSOR=$#BUFFER
    elif [ "$OP" = "checkout" ] && [ "$BR" ]; then
        git checkout "$BR"
    elif [ "$OP" = "remove" ] && [ "$BR" ]; then
      git branch -D "$BR"
      git push origin ":$BR"
    fi
    zle reset-prompt
}
zle -N checkout-branch
bindkey "^G^G" checkout-branch
