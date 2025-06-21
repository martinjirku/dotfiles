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
    local ahead behind changes stash
    local -a gitstatus

    # Exit early in case the worktree is on a detached HEAD
    git rev-parse ${hook_com[branch]}@{upstream} >/dev/null 2>&1 || return 0

    local -a ahead_and_behind=(
        $(git rev-list --left-right --count HEAD...${hook_com[branch]}@{upstream} 2>/dev/null)
    )

    ahead=${ahead_and_behind[1]}
    behind=${ahead_and_behind[2]}
    changes=$(git status --porcelain | grep -c '^[ MADRC??]')
    stash=$(git stash list | wc -l | tr -d ' ')
    (( $ahead )) && gitstatus+=( "%F{green}⇡${ahead}%f" )
    (( $behind )) && gitstatus+=( "%F{red}⇣${behind}%f" )
    (( $changes )) && gitstatus+=( "%F{red}!${changes}%f" )
    (( $stash )) && gitstatus+=( "%F{yellow}!${stash}%f" )

    hook_com[misc]+=" ${(j: :)gitstatus}"
}





# git-ps-preview() {
#     if [[ ! (-d .git && -f .git/refs/heads/*) ]]; then
#         return
#     fi

#     # Get the current branch name
#     branch="%F{green}\ue0a0$(git rev-parse --abbrev-ref HEAD)%f"

#     # Get the number of commits behind the upstream branch
#     behind=$(git rev-list --count HEAD..@{u} 2>/dev/null || echo 0)
#     if [[ $behind = "0" || $behind = "" ]]; then
#         behind=""
#     else
#         behind="%F{red}⇣$behind%f"
#     fi

#     # Get the number of commits ahead of the upstream branch
#     ahead=$(git rev-list --count @{u}..HEAD 2>/dev/null || echo 0)
#     if [[ $ahead = "0" || $ahead = "" ]]; then
#         ahead=""
#     else
#         ahead="%F{green}⇡$ahead%f"
#     fi

#     # Get the number of stashed changes
#     stashed=$(git stash list | wc -l | tr -d ' ')
#     if [[ $stashed == 0 || $stashed = "" ]]; then
#         stashed=""
#     else
#         stashed=" %F{blue}*$stashed%f"
#     fi

#     # Get the number of unstaged changes
#     changes=$(git status --porcelain | grep -c '^[ MADRC]')
#     if [[ $changes = "0" || $changes = "" ]]; then
#         changes=""
#     else
#         changes=" %F{yellow}!$changes%f"
#     fi
    
#     # Output the formatted status
#     echo "$branch $behind$ahead$stashed$changes"
# }

# # autoload -Uz vcs_info

# # zstyle ':vcs_info:*+*:*' debug true
# # inspired by https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
# # zstyle ':vcs_info:git*' formats "(%s)-[%12.12i %b]-" # hash & branch
# ### git: Show marker (T) if there are untracked files in repository
# # Make sure you have added staged to your 'formats':  %c
# # zstyle -e ':vcs_info:git:*' check-for-changes 'estyle-cfc && reply=( true ) || reply=( false )'

# # check if the current directory is in the CFC directory (check for changes)
# # to avoid running git status on every prompt
# # function estyle-cfc() {
# #     local d
# #     local -a cfc_dirs=(
# #         ${HOME}/dev/*(/N)
# #         ${HOME}/Projects/*(/N)
# #         ${HOME}/armed-atk/*(/N)
# #     )

# #     for d in ${cfc_dirs}; do
# #         if [[ -d $d ]]; then
# #             d=${d%/##}
# #             [[ $PWD == $d(|/*) ]] && return 0
# #         fi
# #     done
# #     return 1
# # }
