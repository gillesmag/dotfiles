command -v direnv >/dev/null || return

eval "$(direnv hook "$GM_SHELL_NAME")"
