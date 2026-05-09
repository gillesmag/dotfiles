export EDITOR="vim"

typeset -U path PATH
path=(
  "$HOME/.bin"
  "$HOME/.local/bin"
  $path
)

export PATH

# https://unix.stackexchange.com/questions/197839/why-does-exporting-vim-as-editor-in-zsh-disable-keyboard-shortcuts
set -o emacs
