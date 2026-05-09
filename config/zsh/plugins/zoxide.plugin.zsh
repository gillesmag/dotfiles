command -v zoxide >/dev/null || return

shell_name=$(basename "$SHELL")
eval "$(zoxide init $shell_name)"
