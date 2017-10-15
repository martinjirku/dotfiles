#!/bin/sh



mkdir -p  ~/dotfiles/vim.symlink/autoload
mkdir -p ~/dotfiles/vim.symlink/compiler
mkdir -p ~/dotfiles/vim.symlink/ftdetect
mkdir -p ~/dotfiles/vim.symlink/ftplugin
mkdir -p ~/dotfiles/vim.symlink/indent
mkdir -p ~/dotfiles/vim.symlink/syntax

# elixir plugin
echo installing elixir plugin from $ELIXIR_PLUGIN_PATH

cp -R ~/dotfiles/vim.symlink/bundle/vim-elixir/autoload/ ~/dotfiles/vim.symlink/autoload
cp -R ~/dotfiles/vim.symlink/bundle/vim-elixir/compiler/ ~/dotfiles/vim.symlink/compiler
cp -R ~/dotfiles/vim.symlink/bundle/vim-elixir/ftdetect/ ~/dotfiles/vim.symlink/ftdetect
cp -R ~/dotfiles/vim.symlink/bundle/vim-elixir/ftplugin/ ~/dotfiles/vim.symlink/ftplugin
cp -R ~/dotfiles/vim.symlink/bundle/vim-elixir/indent/ ~/dotfiles/vim.symlink/indent
cp -R ~/dotfiles/vim.symlink/bundle/vim-elixir/syntax/ ~/dotfiles/vim.symlink/syntax
