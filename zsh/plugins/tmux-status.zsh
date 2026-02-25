# Auto-start tmux if not already in tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ] && [ -z "$INSIDE_EMACS" ] && [ -z "$VSCODE_INJECTION" ]; then
  # Check if this is an interactive shell
  if [[ $- == *i* ]]; then
    # Try to attach to existing session, or create new one
    tmux attach-session -t default || tmux new-session -s default
  fi
fi

# Update tmux status bar with command exit status
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
