_record-pwd() {
    echo $PWD >> ~/.zsh_pwd_history
    ruby $ZPLUGDIR/mru/mru.rb
}

add-zsh-hook chpwd _record-pwd
