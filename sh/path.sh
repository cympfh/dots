export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$HOME/Tools/twurl/bin

export PATH=$HOME/bin:$PATH
export PATH=$HOME/bin/stuff:$PATH
export PATH=$PATH:$HOME/bin/stuff/tw/bin
export PATH=$PATH:$HOME/bin/stuff/language-template

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

case $( uname ) in
  Darwin )
    export PATH=/usr/local/git/bin:$PATH
    export PATH=$PATH:/Library/TeX/texbin
    ;;
esac
