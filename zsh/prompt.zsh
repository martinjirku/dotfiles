# https://www.reddit.com/r/zsh/comments/cgbm24/multiline_prompt_the_missing_ingredient/


# Example of two-line ZSH prompt with four components.
#
#   top-left                         top-right
#   bottom-left                   bottom-right
#
# Components can be customized by editing set-prompt function.
#
# Installation:
#
#   (cd && curl -fsSLO https://gist.githubusercontent.com/romkatv/2a107ef9314f0d5f76563725b42f7cab/raw/two-line-prompt.zsh)
#   echo 'source ~/two-line-prompt.zsh' >>~/.zshrc
#
# Accompanying article:
# https://www.reddit.com/r/zsh/comments/cgbm24/multiline_prompt_the_missing_ingredient/
#
# This is only an example. If you are looking for a good ZSH prompt,
# try https://github.com/romkatv/powerlevel10k/.

# Usage: prompt-length TEXT [COLUMNS]
#
# If you run `print -P TEXT`, how many characters will be printed
# on the last line?
#
# Or, equivalently, if you set PROMPT=TEXT with prompt_subst
# option unset, on which column will the cursor be?
#
# The second argument specifies terminal width. Defaults to the
# real terminal width.
#
# The result is stored in REPLY.
#
# Assumes that `%{%}` and `%G` don't lie.
#
# Examples:
#
#   prompt-length ''            => 0
#   prompt-length 'abc'         => 3
#   prompt-length $'abc\nxy'    => 2
#   prompt-length '❎'          => 2
#   prompt-length $'\t'         => 8
#   prompt-length $'\u274E'     => 2
#   prompt-length '%F{red}abc'  => 3
#   prompt-length $'%{a\b%Gb%}' => 1
#   prompt-length '%D'          => 8
#   prompt-length '%1(l..ab)'   => 2
#   prompt-length '%(!.a.)'     => 1 if root, 0 if not
function prompt-length() {
  emulate -L zsh
  local -i COLUMNS=${2:-COLUMNS}
  local -i x y=${#1} m
  if (( y )); then
    while (( ${${(%):-$1%$y(l.1.0)}[-1]} )); do
      x=y
      (( y *= 2 ))
    done
    while (( y > x + 1 )); do
      (( m = x + (y - x) / 2 ))
      (( ${${(%):-$1%$m(l.x.y)}[-1]} = m ))
    done
  fi
  typeset -g REPLY=$x
}

# Usage: fill-line LEFT RIGHT
#
# Sets REPLY to LEFT<spaces>RIGHT with enough spaces in
# the middle to fill a terminal line.
function fill-line() {
  emulate -L zsh
  prompt-length $1
  local -i left_len=REPLY
  prompt-length $2 9999
  local -i right_len=REPLY
  local -i pad_len=$((COLUMNS - left_len - right_len - ${ZLE_RPROMPT_INDENT:-1}))
  if (( pad_len < 1 )); then
    # Not enough space for the right part. Drop it.
    typeset -g REPLY=$1
  else
    local pad=${(pl.$pad_len.. .)}  # pad_len spaces
    typeset -g REPLY=${1}${pad}${2}
  fi
}

# Sets PROMPT and RPROMPT.
#
# Requires: prompt_percent and no_prompt_subst.
function set-prompt() {
  emulate -L zsh
 
  local git_status=$(git-ps-preview)
  local date_str=$(date +"%Y-%m-%d")
  local time_str=$(date +"%H:%M:%S")
  local top_left='%F{blue}%B%~%b%f ${git_status}'
  local top_right='%F{blue}${date_str}%f %F{green}${time_str}%f'
  local bottom_left='%F{green}❯%f '
  local bottom_right=" "

  local REPLY
  fill-line "$top_left" "$top_right"
  PROMPT=$REPLY$'\n'$bottom_left
  RPROMPT=$bottom_right
}

setopt no_prompt_{bang,subst} prompt_{cr,percent,sp}
autoload -Uz add-zsh-hook
setopt PROMPT_SUBST
add-zsh-hook precmd set-prompt
