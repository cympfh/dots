setopt prompt_subst
autoload -U colors; colors

PROMPT="
\`prompt-time\` \`prompt-host\`\`prompt-pwd\`\`prompt-git-status\`
   "

COLOR_BLUE=81
COLOR_GRAY=240
COLOR_RED=red
COLOR_YELLOW=221

prompt-colon() {
    echo -n "%F{$COLOR_GRAY}:%f"
}

prompt-time() {
    echo -n "%(?.%F{$COLOR_GRAY}.%F{$COLOR_RED})%T%f"
}

prompt-host() {
    if [ "$LOCALHOST" -eq 0 ]; then
        echo -n "%F{$COLOR_YELLOW}${HOST}%f"
        prompt-colon
    fi
}

prompt-pwd() {
    echo -n "%F{$COLOR_YELLOW}"
    echo -n ${PWD/#$HOME/\~} | sed 's#\([^/]\{,3\}\)\([^/]*\)/#\1/#g'
    echo -n "%f"
}

prompt-git-status() {

    # not in git?
    if ! git branch >/dev/null 2>&1; then
        return
    fi

    local branchname=$(git branch 2>/dev/null | grep '*' | sed 's/\* //')

    if [ ! -z "$(git status --short 2>/dev/null)" ]; then  # something to commit
        local statuscolor="%F{$COLOR_RED}"
    elif git status 2>/dev/null | grep "branch is ahead" >/dev/null; then  # something to push
        local statuscolor="%F{$COLOR_BLUE}"
    else
        local statuscolor="%F{$COLOR_GRAY}"
    fi

    prompt-colon
    echo -n "$statuscolor$branchname%f"
}

TMOUT=10
TRAPALRM() {
    zle reset-prompt
}
