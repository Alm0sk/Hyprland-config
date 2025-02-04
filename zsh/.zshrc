#########################
### ZSH Configuration ###
#########################

# Path to Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

################
### Plugins ###
###############

plugins=(git)

source $ZSH/oh-my-zsh.sh

###############
### Aliases ###
###############

alias up="clear && fastfetch && echo && echo && echo && paru -Syu"

# Starship
export STARSHIP_CONFIG=~/.config/dots/starship/starship.toml
eval "$(starship init zsh)"
