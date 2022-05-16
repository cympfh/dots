case $( uname -s ) in

  Linux )
    alias l='ls --color'
    alias ls='ls --color'
    alias ll='ls -lh --color'
    alias mplayer='mplayer -vo x11 -zoom -af scaletempo -speed 1.05 -correct-pts'
    alias mozc-tool='/usr/lib/mozc/mozc_tool --mode=config_dialog'
    ;;

  * )
    alias l='ls -G'
    alias ls='ls -G'
    alias ll='ls -lh -G'
    ;;

esac

alias g='git'
alias vi='vim'
alias nv='nvim'
alias j='LC_ALL=C $EDITOR -c JournalNew'
alias e='exa'

mkcd() {
    mkdir "$1" && cd "$1"
}

json-keys() {
    jq -r '[path(..)|map(if type=="number" then "[]" else tostring end)|join(".")|split(".[]")|join("[]")]|unique|map("."+.)|.[]'
}
