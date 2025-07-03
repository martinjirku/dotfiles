# HISTFILE=${ZDOTDIR:-~}/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt INC_APPEND_HISTORY
# Save each command’s beginning timestamp (in seconds since the epoch) and the duration
# (in seconds) to the history file. The format of this prefixed data is:
# ‘: <beginning time>:<elapsed seconds>;<command>’.
setopt EXTENDED_HISTORY
# If the internal history needs to be trimmed to add the current command line, setting this option
# will cause the oldest history event that has a duplicate to be lost before losing a unique event from the list.
setopt HIST_EXPIRE_DUPS_FIRST
# When searching for history entries in the line editor, do not display duplicates of a
# line previously found, even if the duplicates are not contiguous.
setopt HIST_FIND_NO_DUPS
# If a new command line being added to the history list duplicates an older one,
# the older command is removed from the list (even if it is not the previous event).
setopt HIST_IGNORE_ALL_DUPS
# Do not enter command lines into the history list if they are duplicates of the previous event
setopt HIST_IGNORE_DUPS
# Remove command lines from the history list when the first character on the line is a space, or when one of
# the expanded aliases contains a leading space.
setopt HIST_IGNORE_SPACE
# Remove function definitions from the history list. Note that the function lingers in the internal history
# until the next command is entered before it vanishes, allowing you to briefly reuse or edit the definition.
setopt HIST_NO_FUNCTIONS
# When writing out the history file, older commands that duplicate newer ones are omitted.
setopt HIST_SAVE_NO_DUPS

bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward
