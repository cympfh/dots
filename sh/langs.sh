# vim: set ft=bash

## CUDA
export CUDA_PATH=/usr/local/cuda
addpath "$CUDA_PATH/bin" 1

## Go
addpath "/usr/local/go/bin" 1
if [ -d $HOME/go ]; then
    export GOPATH=$HOME/go
    addpath "$HOME/go/bin" 10
fi

## Julia
addpath "/opt/julia/bin/" 1

## Node (javascript)
# curl -L git.io/nodebrew | perl - setup
addpath "$HOME/.nodebrew/current/bin" 10
addpath "$HOME/node_modules/.bin" 10

## Python
# pyenv
if [ -d ~/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    addpath "$HOME/.pyenv/bin" 10
    addpath "$HOME/.pyenv/shims" 10
    eval "$(pyenv init - zsh --no-rehash)"
fi
# venv
addpath ./.venv/bin 100

## Rust
addpath $HOME/.cargo/bin 20
# racer (https://github.com/racer-rust/racer)
if ( which rustc >/dev/null 2>&1 ); then
    export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src
fi

## TeX
case $( uname ) in
  Darwin )
    addpath /usr/local/git/bin 1
    addpath /Library/TeX/texbin 1
    ;;
esac
