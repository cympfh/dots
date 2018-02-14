autoload -U add-zsh-hook

_record-pwd() {
    echo $PWD >> ~/.zsh_pwd_history
    ruby ~/.dots/sh/mru/mru.rb
}

add-zsh-hook chpwd _record-pwd
