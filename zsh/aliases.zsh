alias rr='source ~/.zshrc'

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias grep='grep --color=auto'
alias mv='mv -i'
alias rfz=${ZDOTDIR:-~}/scripts/rfz.zsh
alias editor=code
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# lowercase uuid
alias uuid="uuidgen | tr A-Z a-z"
# escaped: sed -e 's/\\\"/\"/g' -e 's/\\\\/\\/g'
alias fixjson="sed -e 's/\\\\\\\"/\\\"/g' -e 's/\\\\\\\\/\\\\/g'"
alias t='task'
alias chrome='open -a "Google Chrome"'
# open remote origin
alias or='open "https://${${$(git remote get-url origin)//://}/git@/}"'
