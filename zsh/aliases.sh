# Base
alias up="clear && fastfetch && echo && paru -Syu"
alias c="clear && fastfetch && echo"
alias error="echo $?"

# eza

eza_params=(
'--git' '--icons' '--group' '--group-directories-first'
'--time-style=long-iso' '--header'
)

alias eza='eza $eza_params'

# Docker
alias kali="docker start kali && docker attach kali"