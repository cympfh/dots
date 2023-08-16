export PATH=$HOME/.local/bin:$PATH
if ( command -v nvim >/dev/null ); then
  export EDITOR=nvim
elif ( command -v vim >/dev/null ); then
  export EDITOR=vim
elif ( command -v vi >/dev/null ); then
  export EDITOR=vi
else
  export EDITOR=
fi
alias e=$EDITOR
