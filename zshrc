setopt histignorealldups sharehistory
source ~/.dots/sh/bindkey.zsh

fpath=(~/.zsh/completion $fpath)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -Uz compinit && compinit -i
setopt correct
setopt nonomatch
setopt interactivecomments
setopt noflowcontrol
export EDITOR='vim'

source ~/.dots/sh/path.sh
source ~/.dots/sh/prompt.sh
source ~/.dots/sh/exec_time_report.sh
source ~/.dots/sh/prg.sh
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

export ANSIBLE_NOCOWS=1
