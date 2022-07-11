#!/usr/bin/env bash

set -euox pipefail

# Install dependencies

brew bundle

# Symlink configuration
if [[ ! -d "$HOME/.config" ]]; then
  mkdir ~/.config
fi

ln -nfs "$(pwd)/nvim" ~/.config/nvim

# ZSH configuration
if [[ -f "$HOME/.zshrc" ]]; then
  cp "$HOME/.zshrc" "$HOME/.zshrc_backup"
fi

ln -nfs "$(pwd)/zsh/zshrc.sh" "$HOME/.zshrc"
ln -nfs "$(pwd)/zsh/config" "$HOME/.zsh"

# tmux
ln -nfs "$(pwd)/tmux/.tmux.conf" "$HOME/.tmux.conf"
