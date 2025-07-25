# `shpath` is defined in `shell-path-manager.zsh`
# NOTE: system < system-prior < user < user-prior

shpath add system /bin
shpath add system /usr/bin
shpath add system-prior /usr/local/bin
shpath add system-prior /usr/local/go/bin/
shpath add system-prior /usr/local/go/bin/
shpath add system-prior /opt/homebrew/bin
shpath add user $HOME/bin
shpath add user $HOME/.local/bin
shpath add user $HOME/.local/opt/node/bin
shpath add user $HOME/Dropbox/bin
shpath add user $HOME/Dropbox/mls
shpath add user $HOME/dw/bin
shpath add user $HOME/dw/git/khattori/amadeus/bin
shpath add user $HOME/git/imgur
shpath add user $HOME/git/language-template
shpath add user $HOME/git/mastodon-cli/bin
shpath add user $HOME/git/mline/bin
shpath add user $HOME/test/bin
shpath add user $HOME/git/hf/bin
shpath add user $HOME/git/ac/bin
shpath add user $HOME/git/grow.md.fasthtml/bin
shpath add user $HOME/.deno/bin

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
