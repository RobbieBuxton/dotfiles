# Path to oh-my-zsh installation
export ZSH="$HOME/.nix-profile/share/oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Dotfiles management alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.my-dotfiles --work-tree=$HOME'

# Load custom configuration if it exists
if [ -f "$HOME/.zshrc-custom" ]; then
    source "$HOME/.zshrc-custom"
fi
