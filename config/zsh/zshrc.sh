#zmodload zsh/zprof
export ZSH=$HOME/.config/zsh/config

plugins=(
  bat
  exa
  git
  tmux
  vim
  zoxide
  rtx
  home-manager
)

source $ZSH/init.sh
#zprof
