path-initial() {
    echo $PATH | sed 's/:/\n/g' |
        while read p; do
            echo 1 $p
        done | sort | uniq > /tmp/zsh-paths
}

addpath() {
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
            sort -nr |
            uniq |
            awk '{print $2}' |
            tr '\n' ':' |
            sed 's/:$//'
        )
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

path-refresh
