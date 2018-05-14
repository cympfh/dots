case $TERM in
    screen-* )
        preexec() {
          echo -ne "\ek$1\e\\"
        }
        precmd() {
          #echo -ne "\ek$(basename $SHELL)\e\\"
          echo -ne "\ek$(pwd|sed -e 's#/home/[^/]*#~#' -e 's#/Users/[^/]*#~#')\e\\"
        }
    ;;
esac

case "$TERM" in
    screen-* )
        echo -ne "\ek$(pwd|sed -e 's#/home/[^/]*#~#' -e 's#/Users/[^/]*#~#')\e\\"
        ;;
esac

screen-x() {
    TAB=$(printf '\t')
    SCREENNAME=$(screen -ls | grep "^${TAB}" | sed 's/^\t//g' | peco)
    if [ "${SCREENNAME}" ]; then
        SCREENNAME=$(echo "${SCREENNAME}" | sed 's/\t.*//g')
        echo -ne "\033]0;${SCREENNAME}\007"
        screen -x "${SCREENNAME}"
    fi
}

screen-s() {
    SCREENNAME=$(basename $(pwd))
    echo -ne "\033]0;${SCREENNAME}\007"
    screen -S "${SCREENNAME}"
}

toggle-screen-memo() {
    FILE=/tmp/screen.memo.txt
    if [ -f $FILE ]; then
        rm $FILE
    else
        if [ -f ~/.twurlrc ]; then
            TWITTER="@$( cat ~/.twurlrc | grep -A 1 default_profile | tail -1 | sed 's/ *- *//g' )"
        fi
        echo "$TWITTER" > /tmp/screen.memo.txt
    fi
}
zle -N toggle-screen-memo
bindkey "^O" toggle-screen-memo
