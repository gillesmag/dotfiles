if [ -d "$HOME/Library/pnpm" ]; then
  export PNPM_HOME="$HOME/Library/pnpm"
  shell_path_prepend "$PNPM_HOME"
fi

if [ -d "$HOME/.bun" ]; then
  export BUN_INSTALL="$HOME/.bun"
  shell_path_prepend "$BUN_INSTALL/bin"

  if [ "$GM_SHELL_NAME" = "zsh" ] && [ -s "$BUN_INSTALL/_bun" ]; then
    # shellcheck disable=SC1091
    . "$BUN_INSTALL/_bun"
  fi
fi
