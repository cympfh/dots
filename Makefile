.PHONY: vim screen zsh i3 git tmux
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
	[ -f ~/.zshrc ] || echo source $(PWD_TILDE)/zshrc >> ~/.zshrc
	ln -s ~/.dots/zlogout ~/.zlogout

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

## link .chunkwmrc
chunkwm:
	ln -s $(PWD)/chunkwmrc ~/.chunkwmrc

## link .tmux.conf
tmux:
	ln -s $(PWD)/tmux/conf ~/.tmux.conf

.DEFAULT_GOAL := help

help:
	@grep -A1 '^## ' ${MAKEFILE_LIST} | grep -v '^--' |\
		sed 's/^## *//g; s/:$$//g' |\
awk 'NR % 2 == 1 { PREV=$$0 } NR % 2 == 0 { printf "\033[32m%-8s\033[0m --- %s\n", $$0, PREV }'
