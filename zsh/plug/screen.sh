export SCREENDIR=$HOME/.screen

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
        screen -wipe
        SCREENNAME=$(
            screen -ls |
                grep '^\s' |
                sed 's/\s\s*\([0-9]*\)\.\([^\t]*\)\t(\(.*\))/\1\t\2\t\3/' |
                sort -k 2,2 |
                awk '{print $1"."$2, "("$3")"}' |
                peco |
                awk '{print $1}'
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
        screen -wipe
        SCREENNAME=${1:-$(basename $(pwd))}
        echo -ne "\033]0;${SCREENNAME}\007"
        screen -S "${SCREENNAME}"
    fi
}
