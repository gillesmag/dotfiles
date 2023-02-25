command -v zoxide > /dev/null 2>&1 || return

shell_name=$(basename "$SHELL")
eval "$(zoxide init $shell_name)"
