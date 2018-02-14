setopt histignorealldups sharehistory
source ~/.dots/sh/bindkey.zsh

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
setopt correct
setopt nonomatch
export EDITOR='vim'

source ~/.dots/sh/path.sh
source ~/.dots/sh/prompt.sh
source ~/.dots/sh/prg.sh
source ~/.dots/sh/dict.sh
source ~/.dots/sh/alias.sh
source ~/.dots/sh/calendar.sh
source ~/.dots/sh/history.sh
source ~/.dots/sh/screen.sh
source ~/.dots/sh/interpreter.sh
source ~/.dots/sh/syntax-hightlight.sh

export ANSIBLE_NOCOWS=1
