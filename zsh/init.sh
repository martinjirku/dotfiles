#!/bin/sh

#prepare the zsh-git-prompt
zshGitPromptDir="$DOTFILES_ROOT/zsh/zsh-git-prompt"
zshGitPromptGitPath="git@github.com:martinjirku/zsh-git-prompt.git"
if [ ! -d $zshGitPromptDir ]; then
  git clone ${zshGitPromptGitPath} ${zshGitPromptDir} >/dev/null 2>&1
  success "${zshGitPromptDir} was cloned from ${zshGitPromptGitPath}"
fi
