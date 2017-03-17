autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

white() {
  echo "%{$fg[white]%}"
}

red() {
  echo "%{$fg[red]%}"
}

green() {
  echo "%{$fg[green]%}"
}

cyan() {
  echo "%{$fg[cyan]%}"
}

yellow() {
  echo "%{$fg[yellow]%}"
}

reset_color() {
  echo "%{$reset_color%}"
}

get_time_date() {
  echo "$(white)[$(red)%* %D$(reset_color)$(white)]"
}

get_user_and_machine() {
  echo "$(green) %B%n%b$(white)@%M$(reset_color)"
}

get_path() {
  echo "$(cyan)%B%d%b$(yellow)"
}

source "${ZSH}/zsh/zsh-git-prompt/zshrc.sh"

#overwrite ZSH_THEME_GIT_PROMPT_PREFIX variable
ZSH_THEME_GIT_PROMPT_PREFIX=" ("

export PROMPT='
$(get_time_date)$(get_user_and_machine)$(git_super_status)$(white):
$(get_path) $ $(reset_color)'
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}$(reset_color)"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}