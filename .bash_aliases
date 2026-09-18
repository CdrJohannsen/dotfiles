alias update='sudo dnf upgrade --refresh && flatpak upgrade'
alias c=clear
alias ls='eza -A --color=auto --group-directories-first -h'
alias lock='loginctl lock-sessions'
alias vim='nvim'
alias cat='bat'
alias grep='rg'
alias fzf='fzf --preview "bat --color=always --style=numbers {}"'
alias find='fd'

alias :q="exit"
alias :wq="exit"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

batdiff() {
    git diff --name-only --relative --diff-filter=d $1 | xargs bat --diff
}

share() {
    real_path=$(realpath $1)
    base_name=$(basename ${real_path})
    ln -s ${real_path} ~/Public/${base_name}
    pushd ~/Public/
    python -m pyftpdlib
    popd
    unlink ~/Public/${base_name}
}
