all: install

dwm:
	stow -t ${HOME} -R dwm

zsh:
	stow -t ${HOME} -R zsh

formatter:
	stow -t ${HOME} -R formatter

picom:
	stow -t ${HOME} -R picom

rofi:
	stow -t ${HOME} -R rofi

Xorg:
	stow -t ${HOME} -R Xorg

rime-ice:
	git submodule update --init
	stow -t ${HOME} -R rime-ice

git:
	stow -t ${HOME} -R git

starship:
	stow -t ${HOME} -R starship

wechat:
	stow -t ${HOME} -R wechat

dunst:
	stow -t ${HOME} -R dunst

kitty:
	stow -t ${HOME} -R kitty

gdb:
	stow -t ${HOME} -R gdb

xremap:
	stow -t ${HOME} -R xremap

install: dwm formatter picom rofi Xorg rime-ice starship wechat dunst kitty gdb git zsh xremap

.PHONY: all install dwm formatter picom rofi Xorg rime-ice starship wechat dunst kitty gdb git zsh xremap
