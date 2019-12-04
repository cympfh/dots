export PATH=$HOME/bin:$PATH
export PATH=$HOME/bin/external:$PATH
export PATH=$HOME/bin/stuff:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/sbin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

if [ -d $HOME/Dropbox/bin ]; then
    export PATH=$HOME/Dropbox/bin:$PATH
fi

if [ -d ~/Tools/twurl ]; then
    export PATH=$PATH:$HOME/Tools/twurl/bin
elif [ -d ~/git/twurl ]; then
    export PATH=$PATH:$HOME/git/twurl/bin
fi

if [ -d ~/git/mastodon-cli/ ]; then
    export PATH=$PATH:$HOME/git/mastodon-cli/bin
elif [ -d ~/Tools/mastodon-cli/ ]; then
    export PATH=$PATH:$HOME/Tools/mastodon-cli/bin
elif [ -d ~/bin/stuff/mastodon-cli/ ]; then
    export PATH=$PATH:$HOME/bin/stuff/mastodon-cli/bin
fi

if [ -d ~/bin/stuff/tw ]; then
    export PATH=$PATH:$HOME/bin/stuff/tw/bin
elif [ -d ~/git/tw ] ; then
    export PATH=$PATH:$HOME/git/tw/bin
fi

if [ -d ~/bin/stuff/language-template ]; then
    export PATH=$PATH:$HOME/bin/stuff/language-template
elif [ -d ~/git/language-template ]; then
    export PATH=$PATH:$HOME/git/language-template
fi

if [ -d ~/.pyenv/shims ]; then
    export PATH=$PATH:$HOME/.pyenv/shims
fi

if [ -d ~/git/imgur ]; then
    export PATH=$PATH:$HOME/git/imgur
fi
