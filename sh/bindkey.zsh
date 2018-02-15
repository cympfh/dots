bindkey -d
bindkey -v

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
    cd $(cat ~/.zsh_pwd_history | tac | peco)
    zle reset-prompt
}
zle -N cd-recent
bindkey "^G^R" cd-recent

#
# history
#
call-history() {
    BUFFER=$(history -n 1 | tac | peco --query "$BUFFER")
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N call-history
bindkey "^R" call-history
