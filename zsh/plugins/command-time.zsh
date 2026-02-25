# taken from: https://github.com/popstas/zsh-command-time/commit/803d26eef526bff1494d1a584e46a6e08d25d918
_command_time_preexec() {
  # check excluded
  if [ -n "$ZSH_COMMAND_TIME_EXCLUDE" ]; then
    cmd="$1"
  for exc ($ZSH_COMMAND_TIME_EXCLUDE) do;
      if [ "$(echo $cmd | grep -c "$exc")" -gt 0 ]; then
        # echo "command excluded: $exc"
        return
      fi
    done
  fi

  timer=${timer:-$SECONDS}
  ZSH_COMMAND_TIME_MSG=${ZSH_COMMAND_TIME_MSG-"Time: %s"}
  ZSH_COMMAND_TIME_COLOR=${ZSH_COMMAND_TIME_COLOR-"white"}
  export ZSH_COMMAND_TIME=""
}

_command_time_precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    if [ -n "$TTY" ] && [ $timer_show -ge ${ZSH_COMMAND_TIME_MIN_SECONDS:-3} ]; then
      export ZSH_COMMAND_TIME="$timer_show"
      # Update tmux status bar if inside tmux
      if [ -n "$TMUX" ]; then
        timer_formatted=$(printf '%dh:%02dm:%02ds' $(($timer_show/3600)) $(($timer_show%3600/60)) $(($timer_show%60)))
        tmux set-environment -g ZSH_COMMAND_TIME "$timer_formatted" 2>/dev/null
        tmux set-environment -g ZSH_COMMAND_TIME_RAW "$timer_show" 2>/dev/null
      fi
      # Only print in shell if not inside tmux (tmux status bar will show it)
      if [ ! -z ${ZSH_COMMAND_TIME_MSG} ] && [ -z "$TMUX" ]; then
        zsh_command_time
      fi
    else
      # Clear command time if below threshold or no timer
      if [ -n "$TMUX" ]; then
        tmux set-environment -g ZSH_COMMAND_TIME "" 2>/dev/null
        tmux set-environment -g ZSH_COMMAND_TIME_RAW "" 2>/dev/null
      fi
    fi
    unset timer
  fi
}

zsh_command_time() {
  if [ -n "$ZSH_COMMAND_TIME" ]; then
    timer_show=$(printf '%dh:%02dm:%02ds\n' $(($ZSH_COMMAND_TIME/3600)) $(($ZSH_COMMAND_TIME%3600/60)) $(($ZSH_COMMAND_TIME%60)))
    print -P "%F{$ZSH_COMMAND_TIME_COLOR}$(printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show")%f"
  fi
}

precmd_functions+=(_command_time_precmd)
preexec_functions+=(_command_time_preexec)
