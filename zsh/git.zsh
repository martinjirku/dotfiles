export GIT_PAGER="LESS -FRXK"

autoload -Uz vcs_info
precmd() { vcs_info }

# Enable substitution in the prompt.
setopt prompt_subst

# Set the format for vcs_info.
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '%F{blue}%b%f%m'
zstyle ':vcs_info:git:*' actionformats "%F{blue}%b|%a%f%m"

zstyle ':vcs_info:git*+set-message:*' hooks git-st
# https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples#L180
function +vi-git-st() {
    local ahead behind stagedChanges notStagedChanges stash
    local -a gitstatus

    # Exit early in case the worktree is on a detached HEAD
    git rev-parse ${hook_com[branch]}@{upstream} >/dev/null 2>&1 || return 0

    local -a ahead_and_behind=(
        $(git rev-list --left-right --count HEAD...${hook_com[branch]}@{upstream} 2>/dev/null)
    )

    ahead=${ahead_and_behind[1]}
    behind=${ahead_and_behind[2]}
    # stagedChanges=$(git status --porcelain | grep -c '^[ MADRC??]')
    # notStagedChanges=$(git status --porcelain | grep -c '^[ MADRC??]')
    stagedChanges=$(git diff --cached --numstat | grep -vE '^0\t0' | wc -l | xargs)
    notStagedChanges=$(git diff --numstat | grep -vE '^0\t0' | wc -l | xargs)

    stash=$(git stash list | wc -l | tr -d ' ')
    (( $ahead )) && gitstatus+=( "%F{green}⇡${ahead}%f" )
    (( $behind )) && gitstatus+=( "%F{red}⇣${behind}%f" )
    (( $stagedChanges )) && gitstatus+=( "%F{green}!${stagedChanges}%f" )
    (( $notStagedChanges )) && gitstatus+=( "%F{red}!${notStagedChanges}%f" )
    (( $stash )) && gitstatus+=( "%F{yellow}!${stash}%f" )

    hook_com[misc]+=" ${(j: :)gitstatus}"
}

git-graph() {
  git log --all --graph --oneline --decorate --color
}

git-linehist() {
  git log -L "$1" --color=always --pretty=format:'%n%C(34)+------------------------------------------------------------------------------+%n%C(34)|%C(reset) %C(yellow)commit %H%C(reset)%n%C(34)|%C(reset) Author: %an <%ae>%n%C(34)|%C(reset) Date:   %ad%n%C(34)+------------------------------------------------------------------------------+%C(reset)' --date=iso -p "${@:2}" |
  awk '
    BEGIN { border = "\033[34m+------------------------------------------------------------------------------+\033[0m" }
    {
      if ($0 ~ /^\033\[34m\+\-\-+/) {
        print $0
        in_commit = 1
      } else if ($0 ~ /^commit / || $0 ~ /^Author:/ || $0 ~ /^Date:/) {
        print $0
      } else if ($0 ~ /^\033\[34m\+\-\-+/ && in_commit) {
        print $0
        in_commit = 0
      } else if ($0 ~ /^diff/ || $0 ~ /^@@/ || $0 ~ /^index /) {
        print "\033[34m|\033[0m " $0
      } else if ($0 ~ /^$/) {
        print "\033[34m|\033[0m"
      } else {
        print "\033[34m|\033[0m " $0
      }
    }
    END { print border }
  '
}

# ALIASES:
alias glh=git-linehist

