# Install

```zsh
cd .dotfiles/zsh
git submodule update --init --recursive
mv ~/.zshrc{'','.bak'}
echo 'export export EDITOR=$(which code)\nexport ZDOTDIR=$HOME/.config/zsh\nsource $ZDOTDIR/.zshrc' > ~/.zshrc
```
