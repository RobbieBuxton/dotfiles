# Dotfiles

## Setup on a New Machine
```bash
git clone --bare https://github.com/RobbieBuxton/dotfiles.git $HOME/.my-dotfiles
git --git-dir=$HOME/.my-dotfiles --work-tree=$HOME checkout
nix profile install ~/dotfiles
exec zsh
```

## Updating Packages
```bash
nix profile upgrade '.*'
```
