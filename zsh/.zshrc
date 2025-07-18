# Load completions
autoload -Uz compaudit compinit promptinit
# Initialize completion system
compinit
# plugins
source ${ZDOTDIR:-~}/plugins/ohmyzsh/plugins/git/git.plugin.zsh
fpath=(${ZDOTDIR:-~}/functions $fpath)

# for fonts https://github.com/ryanoasis/nerd-fonts/wiki/Glyph-Sets-and-Code-Points

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# my configs
source ${ZDOTDIR:-~}/aliases.zsh
source ${ZDOTDIR:-~}/options.zsh
source ${ZDOTDIR:-~}/history.zsh
source ${ZDOTDIR:-~}/completion.zsh
source ${ZDOTDIR:-~}/git.zsh
source ${ZDOTDIR:-~}/fzf.zsh
source ${ZDOTDIR:-~}/functions/ports.zsh
source ${ZDOTDIR:-~}/functions/dj.zsh
source ${ZDOTDIR:-~}/plugins/command-time.zsh

# TODO: work in progress
# source ${ZDOTDIR:-~}/prompt.zsh

PS1=$'%F{blue}%B%~%b%f ${vcs_info_msg_0_}%F{green}❯%f '
RPS1=$'%(?.%F{green}●.%F{red}●[%?]%f) %F{blue}%D%f %F{green}%*%f'


${ZDOTDIR:-~}/install_brew_packages.zsh
source <(fzf --zsh)

# SKDMAN https://sdkman.io/install
# helps to manage jdk, sdk and gradle version
source "/Users/martinjirku/.sdkman/bin/sdkman-init.sh"

# PATH
# export PATH=$PATH:$HOME/dev/Odin
PATH=$PATH:${ZDOTDIR:-~}/scripts
PATH=$PATH:$HOME/go/bin
PATH=$PATH:/usr/local/go/bin/
# man podman-compose
export PODMAN_COMPOSE_PROVIDER=/usr/local/bin/docker-compose
export PODMAN_COMPOSE_WARNING_LOGS=false
