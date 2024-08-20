_call_fuck_git() {
  TMP_DISPLAY=$DISPLAY
  unset DISPLAY
  fuck "git "
  export DISPLAY=$TMP_DISPLAY
  zle reset-prompt
}
zle -N _call_fuck_git
bindkey "^G^G" _call_fuck_git
