# vim: set ft=bash

## CUDA
export CUDA_PATH=/usr/local/cuda
shpath add system "$CUDA_PATH/bin"

## Go
export GOPATH=$HOME/go
shpath add system "/usr/local/go/bin"
shpath add user "$HOME/go/bin"

## Julia
shpath add system "/opt/julia/bin/"

## Node (javascript)
# curl -L git.io/nodebrew | perl - setup
shpath add user "$HOME/.nodebrew/current/bin"
shpath add user "$HOME/node_modules/.bin"

## Python
# pyenv
if [ -d ~/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    shpath add user "$HOME/.pyenv/bin"
    shpath add user "$HOME/.pyenv/shims"
    eval "$($HOME/.pyenv/bin/pyenv init - zsh --no-rehash)"
fi
# venv
shpath add user-prior ./.venv/bin

## Rust
shpath add user $HOME/.cargo/bin
