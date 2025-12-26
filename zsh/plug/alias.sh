alias g='git'
alias j='LC_ALL=C $EDITOR -c JournalNew'
alias x='exa --icons'
alias xl='exa -l --icons'
alias xla='exa -la --icons'

mkcd() {
    mkdir "$1" && cd "$1"
}

alias @='withcache'
alias @curl='withcache -- curl'
