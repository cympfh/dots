# FZF settings

# brew
if [ -d /usr/local/opt/fzf/shell ]; then
  source /usr/local/opt/fzf/shell/completion.zsh
  source /usr/local/opt/fzf/shell/key-bindings.zsh
fi

# apt
if [ -f /usr/share/zsh/vendor-completions/_fzf ]; then
  source /usr/share/zsh/vendor-completions/_fzf
fi
if [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi


export FZF_CTRL_T_OPTS=--reverse
export FZF_CTRL_R_OPTS=--reverse
export FZF_COMPLETION_TRIGGER='@'
