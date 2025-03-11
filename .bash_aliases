alias update='sudo dnf upgrade --refresh && flatpak upgrade'
alias c=clear
alias ls='eza -A --color=auto --group-directories-first -h'
alias lock='gtklock & systemctl suspend'
alias vim='nvim'
alias cat='bat'
alias grep='rg'
alias fzf='fzf --preview "bat --color=always --style=numbers {}"'

alias :q="exit"
alias :wq="exit"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

batdiff() {
    git diff --name-only --relative --diff-filter=d $1 | xargs bat --diff
}
