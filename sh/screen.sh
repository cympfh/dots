if [ "$STY" ]; then
    preexec() {
      echo -ne "\ek$1\e\\"
    }
    precmd() {
      echo -ne "\ek$(pwd|sed -e 's#/home/[^/]*#~#' -e 's#/Users/[^/]*#~#')\e\\"
    }
    echo -ne "\ek$(pwd|sed -e 's#/home/[^/]*#~#' -e 's#/Users/[^/]*#~#')\e\\"
fi

screen-x() {
    if [ "$STY" ]; then
        echo "You are already in screen"
    else
        SCREENNAME=$(
            screen -ls | grep "^	" |
                sed 's/^\t[0-9]*\.//g; s/\t.*//g' |
                peco
        )
        if [ "${SCREENNAME}" ]; then
            echo -ne "\033]0;${SCREENNAME}\007"
            screen -x "${SCREENNAME}"
        fi
    fi
}

screen-s() {
    if [ "$STY" ]; then
        echo "You are already in screen"
    else
        SCREENNAME=${1:-$(basename $(pwd))}
        echo -ne "\033]0;${SCREENNAME}\007"
        screen -S "${SCREENNAME}"
    fi
}
