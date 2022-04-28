# FZF settings

FZF=0

# brew
if [ -d /usr/local/opt/fzf/shell ]; then
  FZF=1
  source /usr/local/opt/fzf/shell/completion.zsh
  source /usr/local/opt/fzf/shell/key-bindings.zsh
fi

# apt
if [ -f /usr/share/zsh/vendor-completions/_fzf ]; then
  FZF=1
  source /usr/share/zsh/vendor-completions/_fzf
fi

# ~/.fzf
if [ -d ~/.fzf/bin ]; then
  FZF=1
  shpath add user "$HOME/.fzf/bin"
  source "$HOME/.fzf/shell/completion.zsh"
  source "$HOME/.fzf/shell/key-bindings.zsh"
fi

if [ $FZF -eq 1 ]; then
  export FZF_CTRL_T_OPTS=--reverse
  export FZF_CTRL_R_OPTS=--reverse
  export FZF_COMPLETION_TRIGGER=""
  bindkey '^T' fzf-completion
  bindkey '^I' $fzf_default_completion
fi
