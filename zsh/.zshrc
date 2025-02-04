#########################
### ZSH Configuration ###
#########################

# Path to Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

################
### Plugins ###
###############

plugins=(
    git
    colored-man-pages
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/custom/plugins/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh

###############
### Aliases ###
###############

alias up="clear && fastfetch && echo && echo && echo && paru -Syu"
alias kali="docker start kali && docker attach kali"
alias error="echo $?"

# Starship
export STARSHIP_CONFIG=~/.config/dots/starship/starship.toml
eval "$(starship init zsh)"
