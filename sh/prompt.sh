setopt prompt_subst
autoload -U colors; colors

SPROMPT="correct %R to %r? (Yes, No, Abort, Edit) "
PROMPT="
%(?.%F{red}.%F{226})%T%f %F{yellow}${HOST}%F{245}:%F{yellow}%~%F{245}:%f\`branch-status\`%f
   "

function branch-status {
    branchname=$(git branch 2>/dev/null | grep '*' | sed 's/\* //')
    # status color
    if [ -z "$(git status --short 2>/dev/null)" ]; then
        statuscolor="%F{yellow}"
    else
        statuscolor="%F{red}"
    fi
    echo "$statuscolor$branchname"
}

TMOUT=5
TRAPALRM() {
    zle reset-prompt
}
