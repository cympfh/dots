setopt prompt_subst
autoload -U colors; colors

SPROMPT="correct %R to %r? (Yes, No, Abort, Edit) "
PROMPT="
\`prompt-time\` \`prompt-host\`\`prompt-pwd\`\`prompt-git-status\`
   "

prompt-colon() {
    echo -n "%F{246}:%f"
}

prompt-time() {
    echo -n "%(?.%F{240}.%F{red})%T%f"
}

prompt-host() {
    if [ -z "$LOCALHOST" ]; then
        echo -n "%F{221}${HOST}%f"
        prompt-colon
    fi
}

prompt-pwd() {
    echo -n "%F{221}"
    echo -n ${PWD/#$HOME/\~} | sed 's#\([^/]\{,3\}\)\([^/]*\)/#\1/#g'
    echo -n "%f"
}

prompt-git-status() {

    # not in git?
    if ! git branch >/dev/null 2>&1; then
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

    prompt-colon
    echo -n "$statuscolor$branchname%f"
}

TMOUT=10
TRAPALRM() {
    zle reset-prompt
}
