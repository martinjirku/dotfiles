# Update tmux status bar with command exit status (when inside tmux)
_tmux_status_precmd() {
  local exit_code=$?
  if [ -n "$TMUX" ]; then
    # Store exit code in tmux environment
    tmux set-environment -g LAST_EXIT_CODE "$exit_code" 2>/dev/null
  fi
}

# Use autoload to ensure it runs early
autoload -Uz add-zsh-hook
add-zsh-hook precmd _tmux_status_precmd
