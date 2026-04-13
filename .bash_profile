if [[ $- == *i* ]] && [[ -z "$ZSH_VERSION" ]] && command -v zsh >/dev/null 2>&1; then
  export SHELL=$(command -v zsh)
  exec zsh -l
fi

[ -f ~/.bashrc ] && . ~/.bashrc
