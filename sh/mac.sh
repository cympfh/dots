export HOMEBREW_NO_AUTO_UPDATE=1

# Cellar
shpath add system-prior "/usr/local/Cellar/ruby/2.3.1_2/bin/"

# GNU tools
shpath add system-prior "/usr/local/opt/gnu-tar/libexec/gnubin"
export MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"
shpath add system-prior "/usr/local/opt/gnu-sed/libexec/gnubin"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
