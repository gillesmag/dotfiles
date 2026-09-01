# The module defines shell_plugins before sourcing this file. Plugin and custom
# paths are selected at runtime.
# shellcheck disable=SC1090,SC1091,SC2154
. "$SHELL_CONFIG/variables.sh"
. "$SHELL_CONFIG/functions.sh"

for shell_plugin in "${shell_plugins[@]}"; do
  plugin_file="$SHELL_CONFIG/plugins/$shell_plugin.plugin.sh"
  if [ -f "$plugin_file" ]; then
    . "$plugin_file"
  fi
done

custom_file="$HOME/.${GM_SHELL_NAME}_custom"
if [ -f "$custom_file" ]; then
  . "$custom_file"
fi

unset custom_file plugin_file shell_plugin shell_plugins
unset -f shell_path_prepend
