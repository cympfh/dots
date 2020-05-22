setopt histignorealldups sharehistory
source ~/.dots/sh/bindkey.zsh

# completion
fpath=(~/.zsh/completion $fpath)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -Uz compinit && compinit -u
autoload -U colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
setopt complete_in_word
zstyle ':completion:*:default' menu select=1
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt list_packed

setopt complete_in_word
unsetopt correct_all
setopt nonomatch
setopt interactivecomments
setopt noflowcontrol
setopt vi
export EDITOR='vim'
export ANSIBLE_NOCOWS=1

source ~/.dots/sh/path.sh  # initial path
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
source ~/.dots/sh/locale.sh

path-refresh
