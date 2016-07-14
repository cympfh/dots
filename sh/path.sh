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

# node w/ nodebrew
# curl -L git.io/nodebrew | perl - setup
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/node_modules/.bin:$PATH

# Python
export PATH=$HOME/anaconda/bin:$PATH
