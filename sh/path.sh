path-initial() {
    [ -f /tmp/zsh-paths-lock ] && return
    echo $PATH | sed 's/:/\n/g' |
        while read p; do
            echo 1 $p
        done | sort | uniq > /tmp/zsh-paths
}

addpath() {
    [ -f /tmp/zsh-paths-lock ] && return
    pathdir="$1"
    priority=${2:-1}
    case "$1" in
        "/*" )
            if [ -d "$pathdir" ]; then
                echo "$priority" "$pathdir" >> /tmp/zsh-paths
            fi
            ;;
        * )
            echo "$priority" "$pathdir" >> /tmp/zsh-paths
            ;;
    esac
}

path-refresh() {
    export PATH=$(
        cat /tmp/zsh-paths |
            sort -u -k 2,2 |
            sort -nr |
            awk '{print $2}' |
            tr '\n' ':' |
            sed 's/:$//'
        )
}

path-lock() {
    touch /tmp/zsh-paths-lock
}

path-unlock() {
    rm /tmp/zsh-paths-lock
}

path-initial

# system bin
addpath /usr/local/bin 1

# user bin
addpath $HOME/bin 10
addpath $HOME/bin/stuff 10
addpath $HOME/.local/bin 10
addpath $HOME/Dropbox/bin 10
addpath $HOME/Dropbox/bin 10
addpath $HOME/Tools/twurl/bin 10
addpath $HOME/git/twurl/bin 10
addpath $HOME/git/mastodon-cli/bin 10
addpath $HOME/git/tw/bin 10
addpath $HOME/git/mdc/ 10
addpath $HOME/git/language-template 10
addpath $HOME/git/imgur 10
addpath $HOME/dw/bin 10
addpath $HOME/Dropbox/mls 10

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
