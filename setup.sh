cat <<EOM > ~/.vimrc
source ~/.dots/vimrc
source ~/.dots/vim/appearance.novel.vim
EOM

cat <<EOM > ~/.screenrc
source ~/.dots/screenrc
source ~/.dots/screen/novel
EOM

cat <<EOM > ~/.zshrc
source ~/.dots/zshrc
EOM

[ -d ~/.i3 ] || mkdir ~/.i3
cp ~/.dots/i3/* ~/.i3

cp ~/.dots/gitconfig ~/.gitconfig
