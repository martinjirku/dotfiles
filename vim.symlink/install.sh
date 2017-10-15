#!/bin/sh



mkdir -p ~/dotfiles/vim.symlink/autoload
mkdir -p ~/dotfiles/vim.symlink/compiler
mkdir -p ~/dotfiles/vim.symlink/ftdetect
mkdir -p ~/dotfiles/vim.symlink/ftplugin
mkdir -p ~/dotfiles/vim.symlink/indent
mkdir -p ~/dotfiles/vim.symlink/syntax
mkdir -p ~/dotfiles/vim.symlink/syntax_checkers
mkdir -p ~/dotfiles/vim.symlink/doc

# syntastic plugin
echo installing synstastic plugin from ./bundle/vim-sytastic
cp -R ~/dotfiles/vim.symlink/bundle/vim-syntastic/doc/ ~/dotfiles/vim.symlink/doc
cp -R ~/dotfiles/vim.symlink/bundle/vim-syntastic/plugin/ ~/dotfiles/vim.symlink/plugin
cp -R ~/dotfiles/vim.symlink/bundle/vim-syntastic/syntax_checkers/ ~/dotfiles/vim.symlink/syntax_checkers
cp -R ~/dotfiles/vim.symlink/bundle/vim-syntastic/autoload/ ~/dotfiles/vim.symlink/autoload

# elixir plugin
echo installing elixir plugin from ./bundle/vim-elixir

cp -R ~/dotfiles/vim.symlink/bundle/vim-elixir/autoload/ ~/dotfiles/vim.symlink/autoload
cp -R ~/dotfiles/vim.symlink/bundle/vim-elixir/compiler/ ~/dotfiles/vim.symlink/compiler
cp -R ~/dotfiles/vim.symlink/bundle/vim-elixir/ftdetect/ ~/dotfiles/vim.symlink/ftdetect
cp -R ~/dotfiles/vim.symlink/bundle/vim-elixir/ftplugin/ ~/dotfiles/vim.symlink/ftplugin
cp -R ~/dotfiles/vim.symlink/bundle/vim-elixir/indent/ ~/dotfiles/vim.symlink/indent
cp -R ~/dotfiles/vim.symlink/bundle/vim-elixir/syntax/ ~/dotfiles/vim.symlink/syntax
