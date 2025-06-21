

fpath=(${ZDOTDIR:-~}/functions $fpath)

# for fonts https://github.com/ryanoasis/nerd-fonts/wiki/Glyph-Sets-and-Code-Points

source ${ZDOTDIR:-~}/aliases.zsh
source ${ZDOTDIR:-~}/aliases.zsh
source ${ZDOTDIR:-~}/options.zsh
source ${ZDOTDIR:-~}/history.zsh
source ${ZDOTDIR:-~}/completion.zsh
source ${ZDOTDIR:-~}/git.zsh
# TODO: work in progress
# source ${ZDOTDIR:-~}/prompt.zsh

setopt PROMPT_SUBST

PS1=$'%F{blue}%B%~%b%f ${vcs_info_msg_0_}%F{green}❯%f '
RPS1=$'%(?.%F{green}●.%F{red}●[%?]%f) %F{blue}%D%f %F{green}%*%f'

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

${ZDOTDIR:-~}/install_brew_packages.zsh

