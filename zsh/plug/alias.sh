alias g='git'
alias vi='vim'
alias nv='nvim'
alias j='LC_ALL=C $EDITOR -c JournalNew'
alias x='exa --icons'
alias xl='exa -l --icons'
alias xla='exa -la --icons'
alias mplayer='mplayer -vo x11 -zoom -af scaletempo -speed 1.05 -correct-pts'
alias mozc-tool='/usr/lib/mozc/mozc_tool --mode=config_dialog'
alias v='vrchatbox'

mkcd() {
    mkdir "$1" && cd "$1"
}
