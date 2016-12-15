export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$HOME/Tools/twurl/bin

export PATH=$HOME/bin:$PATH
export PATH=$HOME/bin/stuff:$PATH
export PATH=$PATH:$HOME/bin/stuff/tw/bin
export PATH=$PATH:$HOME/bin/stuff/language-template

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# MacTeX
case $( uname ) in
  Darwin )
    export PATH=/usr/local/git/bin:$PATH
    export PATH=$PATH:/Library/TeX/texbin
    ;;
esac

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$PATH"
[ -d $PYENV_ROOT ] && eval "$(pyenv init -)"

# node w/ nodebrew
# curl -L git.io/nodebrew | perl - setup
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/node_modules/.bin:$PATH

# Rust, cargo
export PATH=$HOME/.cargo/bin:$PATH

# CUDA
export CUDA_PATH=/usr/local/cuda
export PATH=$CUDA_PATH/bin:$PATH
