# FZF settings
if [ -d /usr/local/opt/fzf/shell ]; then
  source /usr/local/opt/fzf/shell/completion.zsh
  source /usr/local/opt/fzf/shell/key-bindings.zsh
fi

export FZF_CTRL_T_OPTS=--reverse
export FZF_CTRL_R_OPTS=--reverse
