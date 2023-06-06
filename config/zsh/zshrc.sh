#zmodload zsh/zprof
export ZSH=$HOME/.config/zsh/config

plugins=(
  bat
  exa
  git
  tmux
  vim
  zoxide
  home-manager
  direnv
)

source $ZSH/init.sh
#zprof
