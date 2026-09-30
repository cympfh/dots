CACHEFILE=/dev/shm/kirara
TTL=28800  # 8 hours

_refresh-kirara-cache() (
    local cache_tmp
    cache_tmp=$(mktemp "${CACHEFILE}.XXXXXX") || return 1
    trap 'rm -f -- "$cache_tmp"' EXIT
    chmod 600 -- "$cache_tmp" || return 1

    op read op://env/common/env > "$cache_tmp" || return 1
    echo 'export env/common' >&2
    # Keep the documents separate even if the common env has no final newline.
    printf '\n' >> "$cache_tmp" || return 1
    case $HOST in
        mouse* )
            op read op://env/private/env >> "$cache_tmp" || return 1
            echo 'export env/private' >&2
            ;;
        DW* )
            op read op://env/work/env >> "$cache_tmp" || return 1
            echo 'export env/work' >&2
            ;;
        * )
            echo "No additional env for $HOST" >&2
            ;;
    esac
    mv -fT -- "$cache_tmp" "$CACHEFILE" || return 1
)

_load-kirara-cache() {
    local env_script
    env_script=$(sed \
        -e '/^[[:space:]]*$/d' \
        -e '/^[[:space:]]*#/d' \
        -e 's/^[[:space:]]*/export /' \
        "$CACHEFILE") || return 1
    eval "$env_script"
}

refresh-kirara() {
    _refresh-kirara-cache || return 1
    _load-kirara-cache
}

load-kirara() {
    local age cache_mtime
    if [[ -e "$CACHEFILE" || -L "$CACHEFILE" ]]; then
        if [[ ! -f "$CACHEFILE" || ! -O "$CACHEFILE" || -L "$CACHEFILE" ]]; then
            echo "Unsafe cache file: $CACHEFILE" >&2
            return 1
        fi
        chmod 600 -- "$CACHEFILE" || return 1
    fi

    if [[ ! -f "$CACHEFILE" ]]; then
        refresh-kirara
        return $?
    else
        cache_mtime=$(stat -c %Y -- "$CACHEFILE") || return 1
        age=$(( $(date +%s) - cache_mtime ))
        if (( age > TTL )); then
            refresh-kirara
            return $?
        fi
    fi
    _load-kirara-cache
}

clear-kirara() {
    rm -f -- "$CACHEFILE"
}

load-kirara
