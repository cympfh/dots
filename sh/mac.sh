export HOMEBREW_NO_AUTO_UPDATE=1

# Cellar
addpath "/usr/local/Cellar/ruby/2.3.1_2/bin/" 2

# GNU tools
addpath "/usr/local/opt/gnu-tar/libexec/gnubin" 2
export MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"
addpath "/usr/local/opt/gnu-sed/libexec/gnubin" 2
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
