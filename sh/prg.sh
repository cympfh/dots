# vim: set ft=bash

# CUDA
export CUDA_PATH=/usr/local/cuda
export PATH=$CUDA_PATH/bin:$PATH

## Node (javascript)
# curl -L git.io/nodebrew | perl - setup
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/node_modules/.bin:$PATH

## Python
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$PATH"
[ -d $PYENV_ROOT ] && eval "$(pyenv init -)"

## Rust
# racer (https://github.com/racer-rust/racer)
export PATH=$HOME/.cargo/bin:$PATH
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src

## TeX
case $( uname ) in
  Darwin )
    export PATH=/usr/local/git/bin:$PATH
    export PATH=$PATH:/Library/TeX/texbin
    ;;
esac
