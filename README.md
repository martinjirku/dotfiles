# Install

```zsh
git clone https://github.com/martinjirku/dotfiles.git ~/zsh
cd zsh
git submodule update --init --recursive
mv ~/.zshrc{'','.bak'}
echo 'export ZDOTDIR=$HOME/zsh\nsource $ZDOTDIR/.zshrc' > ~/.zshrc
```
