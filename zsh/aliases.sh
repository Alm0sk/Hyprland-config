# Base
alias up="clear && fastfetch && echo && paru -Syu"
alias c="clear && fastfetch && echo"
alias error="echo $?"

# eza

eza_params=(
'--git' '--icons' '--group' '--group-directories-first'
'--time-style=long-iso' '--header'
)

alias eza='eza -l $eza_params'

# Docker
alias lzd="lazydocker"
alias kali="docker start kali && docker attach kali"

# SSH
alias ssh="kitty +kitten ssh"

# Lazy aliases
alias t='terraform'

# git
alias gcgm='git commit --gpg-sign --message'

