# Base
alias up="clear && fastfetch && echo && paru -Syu"
alias c="clear && fastfetch && echo"
alias error="echo $?"

# eza

eza_params=(
'--git' '--icons' '--group' '--group-directories-first'
'--time-style=long-iso'
)

alias ls='eza $eza_params'
alias l='eza --git-ignore $eza_params'
alias ll='eza --all --header --long $eza_params'
alias llm='eza --all --header --long --sort=modified $eza_params'
alias la='eza -la $eza_params'
alias lx='eza -la@ $eza_params'
alias lt='eza --tree $eza_params'
alias tree='eza --tree $eza_params'

# Docker
alias kali="docker start kali && docker attach kali"