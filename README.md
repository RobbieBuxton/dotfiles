# My Dotfiles

Managed using a bare git repository approach.

## Quick Start

The `dotfiles` command is an alias for managing this repo:
```bash
dotfiles status
dotfiles add <file>
dotfiles commit -m "message"
dotfiles push
```

## Setup on a New Machine
```bash
# Clone the bare repo
git clone --bare https://github.com/RobbieBuxton/dotfiles.git $HOME/.my-dotfiles

# Create the alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.my-dotfiles --work-tree=$HOME'

# Checkout the files
dotfiles checkout

# Hide untracked files
dotfiles config --local status.showUntrackedFiles no

# Install the Nix environment
nix profile install ~/dotfiles

# Restart shell
exec zsh
```

## What's Included

- **Zsh config** with oh-my-zsh
- **Nix environment** with: tmux, gh, micro, tree, vscode, git tools (delta, diff-so-fancy, difftastic), and more
- Custom configs go in `~/.zshrc-custom` and `~/.zshenv-custom`

## Updating Packages
```bash
# Update the flake
cd ~/dotfiles
# Edit flake.nix as needed
dotfiles add ~/dotfiles/flake.nix
dotfiles commit -m "Update packages"
dotfiles push

# Reinstall
nix profile upgrade '.*'
```
