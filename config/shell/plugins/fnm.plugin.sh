command -v fnm >/dev/null || return

eval "$(fnm env --use-on-cd --shell "$GM_SHELL_NAME")"
