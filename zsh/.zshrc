#########################
### ZSH Configuration ###
#########################

# Path to Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to my configuration files.
export ZSH_CONF="$HOME/.config/dots/zsh"

################
### Plugins ###
###############

source $ZSH_CONF/plugins_conf.sh

###############
### Aliases ###
###############

source $ZSH_CONF/aliases.sh

################
### Starship ###
################

export STARSHIP_CONFIG=~/.config/dots/starship/starship.toml
eval "$(starship init zsh)"

# Exec on shell startup
fastfetch && echo
