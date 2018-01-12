setopt prompt_subst
autoload -U colors; colors

SPROMPT="correct %R to %r? (Yes, No, Abort, Edit) "
PROMPT="
%(?.%F{red}.%F{226})%T%f %F{yellow}${HOST}%F{245}:%F{yellow}%~%f\`git-status\`
   "

function git-status {

    # not in git?
    git branch >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        return
    fi

    # reponame=$(git remote show origin -n | grep Push | sed 's/^.*://g; s/.git$//g')
    branchname=$(git branch 2>/dev/null | grep '*' | sed 's/\* //')

    if [ -z "$(git status --short 2>/dev/null)" ]; then
        statuscolor="%F{246}"
    else
        statuscolor="%F{red}"
    fi

    echo "%F{245}:$statuscolor$branchname%f"
}

TMOUT=15
TRAPALRM() {
    zle reset-prompt
}
