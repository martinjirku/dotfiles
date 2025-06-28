# source ${ZDOTDIR:-~}/zsh-completions/zsh-completions.plugin.zsh
fpath=(${ZDOTDIR:-~}/plugins/zsh-completions/src $fpath)

# Load completions
autoload -U compinit && compinit

setopt LIST_PACKED
setopt LIST_ROWS_FIRST
