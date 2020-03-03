# vim: set ft=bash

## Go
if [ -d /usr/local/go ]; then
    export PATH=$PATH:/usr/local/go/bin
fi
if [ -d $HOME/go ]; then
    export GOPATH=$HOME/go
    export PATH=$HOME/go/bin:$PATH
fi

## CUDA
export CUDA_PATH=/usr/local/cuda
export PATH=$CUDA_PATH/bin:$PATH

## Node (javascript)
# curl -L git.io/nodebrew | perl - setup
if [ -d $HOME/.nodebrew/current/bin ]; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
fi
if [ -d $HOME/node_modules/.bin ]; then
    export PATH=$HOME/node_modules/.bin:$PATH
fi

## Python
# pyenv
if [ -d ~/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init - zsh --no-rehash)"
fi
# venv
export PATH=./.venv/bin:$PATH

## Rust
[ -d $HOME/.cargo ] && export PATH=$HOME/.cargo/bin:$PATH
# racer (https://github.com/racer-rust/racer)
if ( which rustc >/dev/null 2>&1 ); then
    export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src
fi

## TeX
case $( uname ) in
  Darwin )
    export PATH=/usr/local/git/bin:$PATH
    export PATH=$PATH:/Library/TeX/texbin
    ;;
esac
