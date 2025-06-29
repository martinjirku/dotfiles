# Install

```zsh
git clone git@github.com:martinjirku/zsh.git ~/.dotfiles
cd .dotfiles
git submodule update --init --recursive
mv ~/.zshrc{'','.bak'}
echo 'export ZDOTDIR=$HOME/.config/zsh\nsource $ZDOTDIR/.zshrc' > ~/.zshrc
```
