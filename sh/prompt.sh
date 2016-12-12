SPROMPT="correct %R to %r? (Yes, No, Abort, Edit) "

PROMPT="
%(?.%F{198}.%F{226})%*%f %F{220}${HOST}:%~%f
   "

# shows git/branch
RPROMPT=$'`branch-status-check`'
setopt prompt_subst

autoload -U colors; colors
function branch-status-check {
    local prefix branchname suffix
    if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
        return
    fi
    branchname=`get-branch-name`
    if [[ -z $branchname ]]; then
        return
    fi
    status_color=`get-branch-status` #色だけ返ってくる
    suffix='%{'${reset_color}'%}'
    echo "${status_color}${branchname}${suffix}"
}

function get-branch-name {
    echo `git rev-parse --abbrev-ref HEAD 2> /dev/null`
}

function get-branch-status {
    local res color
    output=`git status --short 2> /dev/null`
    if [ -z "$output" ]; then
        res=':' # status Clean
        color='%{'${fg[green]}'%}'
    elif [[ $output =~ "[\n]?\?\? " ]]; then
        res='?:' # Untracked
        color='%{'${fg[yellow]}'%}'
    elif [[ $output =~ "[\n]? M " ]]; then
        res='M:' # Modified
        color='%{'${fg[red]}'%}'
    else
        res='A:' # Added to commit
        color='%{'${fg[cyan]}'%}'
    fi
    echo "${color}${res}"
}

TMOUT=1
TRAPALRM() {
    zle reset-prompt
}
