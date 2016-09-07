SPROMPT="correct %R to %r? (Yes, No, Abort, Edit) "
PROMPT="
%F{red}%*%f %F{yellow}${HOST}:%~%f
   "

chpwd() {
    if [ -d .git ]; then
        BRANCH=$( git branch | grep '^*' | awk '{print "[" $2 "]"}' )
        RPROMPT="%F{blue}${BRANCH}%f"
    else
        RPROMPT=""
    fi
}
