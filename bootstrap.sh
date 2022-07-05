#!/usr/bin/env bash

set -euox pipefail

# Install dependencies

brew bundle

# Symlink configuration

if [ ! -d "$HOME/.config" ]; then
  mkdir ~/.config
fi

ln -nfs $(pwd)/nvim ~/.config/nvim
