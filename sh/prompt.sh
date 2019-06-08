setopt prompt_subst
autoload -U colors; colors

SPROMPT="correct %R to %r? (Yes, No, Abort, Edit) "
PROMPT="
%F{227}${HOST}%F{246}:%F{227}%~\`git-status\`
   "

function git-status {

    # not in git?
    git branch >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        return
    fi

    # reponame=$(git remote show origin -n | grep Push | sed 's/^.*://g; s/.git$//g')
    branchname=$(git branch 2>/dev/null | grep '*' | sed 's/\* //')

    if [ ! -z "$(git status --short 2>/dev/null)" ]; then  # something to commit
        statuscolor="%F{red}"
    elif git status 2>/dev/null | grep "branch is ahead" >/dev/null; then  # something to push
        statuscolor="%F{81}"
    else
        statuscolor="%F{246}"
    fi

    echo -n "%F{245}:$statuscolor$branchname%f"
}
