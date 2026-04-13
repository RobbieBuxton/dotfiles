# Dotfiles

## Setup on a New Machine
```bash
git clone --bare https://github.com/RobbieBuxton/dotfiles.git $HOME/.my-dotfiles
git --git-dir=$HOME/.my-dotfiles --work-tree=$HOME checkout
nix profile install ~/dotfiles
exec zsh   # only needed once; subsequent logins auto-start zsh via .bash_profile
```

## Updating Packages
```bash
nix profile upgrade --all
```
