
# https://zsh.sourceforge.io/Doc/Release/Options.html
setopt EXTENDED_GLOB
setopt PROMPT_SUBST
setopt LIST_PACKED
setopt LIST_ROWS_FIRST


# vi mode
set -o vi

# Reduce key delay (default is 0.4s which feels sluggish)
export KEYTIMEOUT=1

# todo: extract somewhere else
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'  # block cursor
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'  # beam cursor
  fi
}
zle -N zle-keymap-select

# Copy to system clipboard
bindkey -M vicmd 'y' vi-yank-system-clipboard
bindkey -M vicmd 'Y' vi-yank-eol-system-clipboard

# Paste from system clipboard
bindkey -M vicmd 'p' vi-put-system-clipboard-after
bindkey -M vicmd 'P' vi-put-system-clipboard-before

