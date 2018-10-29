## syntax highlighting
#
# git@github.com:zsh-users/zsh-syntax-highlighting.git
#

REPO_DIR=$HOME/git/zsh-syntax-highlighting
SOURCE=$REPO_DIR/zsh-syntax-highlighting.zsh

if [ -f $SOURCE ]; then
    source $SOURCE
else
    echo "Not found $REPO_DIR"
    echo "Hint: git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ~/git/zsh-syntax-highlighting"
fi
