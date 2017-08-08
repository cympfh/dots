export PATH=$HOME/bin:$PATH
export PATH=$HOME/bin/stuff:$PATH
export PATH=$PATH:/usr/local/sbin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

if [ -d ~/Tools/twurl ]; then
    export PATH=$PATH:$HOME/Tools/twurl/bin
elif [ -d ~/git/twurl ]; then
    export PATH=$PATH:$HOME/git/twurl/bin
fi

if [ -d ~/bin/stuff/tw ]; then
    export PATH=$PATH:$HOME/bin/stuff/tw/bin
elif [ -d ~/git/tw ] ; then
    export PATH=$PATH:$HOME/git/tw/bin
fi

if [ -d ~/bin/stuff/language-template ]; then
    export PATH=$PATH:$HOME/bin/stuff/language-template
elif [ -d ~/git/language-template ]; then
    export PATH=$PATH:$HOME/bin/stuff/language-template
fi
