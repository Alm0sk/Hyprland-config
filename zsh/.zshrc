#########################
### ZSH Configuration ###
#########################

# Path to Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZSH/oh-my-zsh.sh
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

################
### Plugins ###
###############

plugins=(git)

###############
### Aliases ###
###############

alias up="clear && fastfetch && echo && echo && echo && paru -Syu"
