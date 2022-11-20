shpath() {
    case "$1" in
        a* | add )
            shpath-add "$2" "$3"
            ;;
        i* | init )
            shpath-init
            ;;
        r* | refresh )
            shpath-refresh
            ;;
        * )
            shpath-help
            ;;
    esac
}

shpath-help() {
    cat <<EOM
NAME
    shpath - Shell PATH Manager

SYNOPSIS
    shpath [subcommand] [args...]

SUBCOMMAND

    shpath init
        Call this first in .zshrc.

    shpath refresh
        Call this lastly, or after shpath-add.
        \$PATH be updated by this.

    shpath add [PRIORITY] [DIRECTORY]

        PRIORITY
            You can specify from the following:
            1. system
            2. system-prior
            3. user
            4. user-prior
            The later has larger primary.
            NOTE: The original \$PATH before .zshrc are added as the lowest primary ("system").

        DIRECTORY
            The directory path.
            This checks the existence, when the path is absolute (iff begins with '/').
EOM
}

shpath-init() {
    PATH_SYSTEM=
    PATH_SYSTEM_PRIOR=
    PATH_USER=
    PATH_USER_PRIOR=
    PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
}

shpath-add() {
    primary="$1"
    directory="$2"
    if [[ "$directory" =~ "^/" ]] && [ ! -d "$directory" ]; then
        return  # no existence
    fi
    case "$primary" in
        system )
            PATH_SYSTEM="$directory:$PATH_SYSTEM"
            ;;
        system-prior )
            PATH_SYSTEM_PRIOR="$directory:$PATH_SYSTEM_PRIOR"
            ;;
        user )
            PATH_USER="$directory:$PATH_USER"
            ;;
        user-prior )
            PATH_USER_PRIOR="$directory:$PATH_USER_PRIOR"
            ;;
        * )
            echo "[Error] shpath-add: Unknown primary: $primary"
            ;;
    esac
}

shpath-refresh() {
    PATH_TMP=$(
        (
            echo $PATH_USER_PRIOR | tr ':' '\n' | sed '/^$/d' | sed 's/^/0 /g'
            echo $PATH_USER | tr ':' '\n' | sed '/^$/d' | sed 's/^/1 /g'
            echo $PATH_SYSTEM_PRIOR | tr ':' '\n' | sed '/^$/d' | sed 's/^/2 /g'
            echo $PATH_SYSTEM | tr ':' '\n' | sed '/^$/d' | sed 's/^/3 /g'
            echo $PATH | tr ':' '\n' | sed '/^$/d' | sed 's/^/4 /g'
        ) |
        sort -u -k 2,2 |
        sort -n -k 1,1 | awk '{print $2}' | tr '\n' ':'
    )
    PATH=$PATH_TMP
    unset PATH_TMP
    unset PATH_SYSTEM
    unset PATH_SYSTEM_PRIOR
    unset PATH_USER
    unset PATH_USER_PRIOR
}
