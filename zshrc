source ~/.dots/sh/bindkey.zsh
source ~/.dots/sh/shell-path-manager.zsh

shpath init

# completion
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit
setopt list_packed
setopt complete_in_word
unsetopt correct_all
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1
zstyle ':completion::complete:*' use-cache true

setopt interactivecomments
setopt noflowcontrol
setopt nonomatch
setopt vi
export EDITOR='vim'
export ANSIBLE_NOCOWS=1
export HF_DIR=$HOME/Dropbox/hf/

source ~/.dots/sh/path.sh
source ~/.dots/sh/fzf.sh
source ~/.dots/sh/prompt.sh
source ~/.dots/sh/exec_time_report.sh
source ~/.dots/sh/langs.sh
source ~/.dots/sh/procon.sh
source ~/.dots/sh/dict.sh
source ~/.dots/sh/alias.sh
source ~/.dots/sh/fuck.sh
source ~/.dots/sh/calendar.sh
source ~/.dots/sh/history.sh
source ~/.dots/sh/screen.sh
source ~/.dots/sh/git.sh
source ~/.dots/sh/interpreter.sh
source ~/.dots/sh/syntax-hightlight.sh
source ~/.dots/sh/mru/hook.zsh
source ~/.dots/sh/mac.sh
source ~/.dots/sh/windows.sh
source ~/.dots/sh/locale.sh
source ~/.dots/sh/linuxbrew.sh

shpath refresh
