# Install

```zsh
git clone https://github.com/martinjirku/dotfiles.git ~/.dotfiles
cd .dotfiles
git submodule update --init --recursive
mv ~/.zshrc{'','.bak'}
echo 'export ZDOTDIR=$HOME/.config/zsh\nsource $ZDOTDIR/.zshrc' > ~/.zshrc
```
