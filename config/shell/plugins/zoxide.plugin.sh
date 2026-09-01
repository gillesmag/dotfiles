command -v zoxide >/dev/null || return

eval "$(zoxide init "$GM_SHELL_NAME")"
