#########################
### ZSH Configuration ###
#########################

# Path to Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to my configuration files.
export ZSH_CONF="$HOME/.config/dots/zsh"

###############
### Plugins ###
###############

source $ZSH_CONF/plugins_conf.sh

###############
### Flutter ###
###############

export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export CHROME_EXECUTABLE="/usr/bin/firefox"

export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$HOME/develop/flutter/bin:$PATH"

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
