#!/bin/sh
#install vundle

vundle_dir="$DOTFILES_ROOT/vim.symlink/bundle/Vundle.vim"
if [ ! -d $vundle_dir ];
then
	git clone https://github.com/VundleVim/Vundle.vim.git $vundle_dir >/dev/null 2>&1
	success "[vim] VundleVim is cloned into bundle directory"
else
	success "$vundle_dir is already installed"
fi
