if [[ -d "$HOME/Library/pnpm" ]]; then
  export PNPM_HOME="$HOME/Library/pnpm"
  path=("$PNPM_HOME" $path)
fi

if [[ -d "$HOME/.bun" ]]; then
  export BUN_INSTALL="$HOME/.bun"
  # bun completions
  [[ -s "$BUN_INSTALL/_bun" ]] && source "$BUN_INSTALL/_bun"
  path=("$BUN_INSTALL/bin" $path)
fi
