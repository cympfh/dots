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
