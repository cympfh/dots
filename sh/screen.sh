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
    case "$TERM" in
        *screen* )
            echo "You are already in screen"
            ;;
        * )
            SCREENNAME=$(
                screen -ls | grep "^	" |
                    sed 's/^\t[0-9]*\.//g; s/\t.*//g' |
                    peco
            )
            if [ "${SCREENNAME}" ]; then
                echo -ne "\033]0;${SCREENNAME}\007"
                screen -x "${SCREENNAME}"
            fi
            ;;
    esac
}

screen-s() {
    case "$TERM" in
        *screen* )
            echo "You are already in screen"
            ;;
        * )
            SCREENNAME=${1:-$(basename $(pwd))}
            echo -ne "\033]0;${SCREENNAME}\007"
            screen -S "${SCREENNAME}"
            ;;
    esac
}
