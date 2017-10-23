export HISTCONTROL=ignoreboth

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

zshaddhistory() {
    local line=${1%%$'\n'}
    local cmd=${line%% *}

    if [ ${#line} -le 4 ]; then
        return 1
    fi

    case "$cmd" in
        "" )
            # space-start command line
            return 1
            ;;
        l | ll | ls | cd | man | tw | pwd | fg | bg | hisotry | rm )
            return 1
            ;;
        * )
            ;;
    esac
}

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
