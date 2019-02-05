.PHONY: vim screen zsh i3 git
PWD_TILDE=$(shell pwd | sed "s,^${HOME},\\\\~,g")

## set .vimrc
vim:
	echo source $(PWD_TILDE)/vimrc >> ~/.vimrc
	echo source $(PWD_TILDE)/vim/appearance.novel.vim >> ~/.vimrc

## set .screenrc
screen:
	echo source $(PWD_TILDE)/screenrc >> ~/.screenrc
	echo source $(PWD_TILDE)/screen/novel >> ~/.screenrc

## set .bashrc
bash:
	echo source $(PWD_TILDE)/bashrc >> ~/.bashrc

## set .zshrc
zsh:
	echo source $(PWD_TILDE)/zshrc >> ~/.zshrc

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

.DEFAULT_GOAL := help

help:
	@grep -A1 '^## ' ${MAKEFILE_LIST} | grep -v '^--' |\
		sed 's/^## *//g; s/:$$//g' |\
awk 'NR % 2 == 1 { PREV=$$0 } NR % 2 == 0 { printf "\033[32m%-8s\033[0m --- %s\n", $$0, PREV }'
