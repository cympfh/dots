.PHONY: feh vim screen bash zsh i3 git input tmux help nvim
PWD_TILDE=$(shell pwd | sed "s,^${HOME},\\\\~,g")

## feh config
feh:
	[ -d ~/.config/feh ] || mkdir -p ~/.config/feh/
	ln -s ~/.dots/feh_keys ~/.config/feh/keys

## set .vimrc
vim:
	[ -d ~/.vim/undo ] || mkdir -p ~/.vim/undo/
	[ -f ~/.vim/autoload/plug.vim ] || curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo source $(PWD_TILDE)/vimrc >> ~/.vimrc
	echo source $(PWD_TILDE)/vim/colorscheme/dark.vim >> ~/.vimrc

## set .screenrc
screen:
	echo source $(PWD_TILDE)/screenrc >> ~/.screenrc
	echo source $(PWD_TILDE)/screen/novel >> ~/.screenrc

## set .bashrc
bash:
	echo source $(PWD_TILDE)/bashrc >> ~/.bashrc

## set .zshrc
zsh:
	mkdir -p ~/.config/zsh
	ln -sf ~/.dots/zsh/zshenv ~/.zshenv
	ln -sf ~/.dots/zsh/zlogout ~/.config/zsh/.zlogout
	echo source $(PWD_TILDE)/zsh/zshrc >> ~/.config/zsh/.zshrc

## cp .i3/config
i3:
	[ -d ~/.i3 ] || mkdir ~/.i3
	cp ./i3/config ~/.i3/config

## link .gitconfig
git:
	ln -s $(PWD)/gitconfig ~/.gitconfig

## link .inputrc
input:
	ln -s $(PWD)/inputrc ~/.inputrc

## link .tmux.conf
tmux:
	ln -s $(PWD)/tmux/conf ~/.tmux.conf

## link ~/.config/nvim, coc, vim-plug
nvim:
	ln -s $(PWD)/nvim ~/.config/nvim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim --headless -u ~/.config/nvim/init.vim +PlugInstall +qall
	nvim --headless -u ~/.config/nvim/init.vim +CocUpdateSync +qall

.DEFAULT_GOAL := help

help:
	@grep -A1 '^## ' ${MAKEFILE_LIST} | grep -v '^--' |\
		sed 's/^## *//g; s/:$$//g' |\
awk 'NR % 2 == 1 { PREV=$$0 } NR % 2 == 0 { printf "\033[32m%-8s\033[0m --- %s\n", $$0, PREV }'
