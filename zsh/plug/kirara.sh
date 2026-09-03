CACHEFILE=/dev/shm/kirara
TTL=3600

refresh-kirara() {
    : > $CACHEFILE
    op read op://env/common/env > $CACHEFILE
    echo 'export env/common' >&2
    case $HOST in
        mouse* )
            op read op://env/private/env >> $CACHEFILE
            echo 'export env/private' >&2
            ;;
        DW* )
            op read op://env/work/env >> $CACHEFILE
            echo 'export env/work' >&2
            ;;
        * )
            echo "No additional env for $HOST" >&2
            ;;
    esac
}

load-kirara() {
    if [[ ! -f $CACHEFILE ]]; then
        refresh-kirara
    else
        age=$(( $(date +%s) - $(stat -c %Y $CACHEFILE) ))
        if (( age > TTL )); then
            refresh-kirara
        fi
    fi
    eval $(
        cat $CACHEFILE |
        awk '/./' |
        sed '/^#/d' |
        sed 's/^\(.\)/export \1/'
    )
}

clear-kirara() {
    rm -f $CACHEFILE
}

load-kirara
