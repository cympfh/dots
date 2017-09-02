setopt histignorealldups sharehistory
bindkey -v
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
setopt correct
setopt nonomatch
export EDITOR=$( which vim )
alias vi=$EDITOR
export HOMEBREW_GITHUB_API_TOKEN=4efa3f332c1477d6688ea95cad951c2cf2128e2c

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
