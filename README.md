# MJ's dotfiles

## Installation

```bash
git clone --recurse-submodules git@github.com:martinjirku/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git submodule update --init --recursive

ln -s ~/.dotfiles/zsh ~/.config/zsh
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/tmux ~/.config/tmux
ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf
```
