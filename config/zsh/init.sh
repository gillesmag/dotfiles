for plugin in ${plugins[@]}; do
  if [[ -f "$ZSH/plugins/$plugin.plugin.zsh" ]]; then
    source "$ZSH/plugins/$plugin.plugin.zsh"
  fi
done
unset plugin

source "$ZSH/functions.zsh"
source "$ZSH/variables.zsh"

if [[ -f "$HOME/.zsh_custom" ]]; then
  source "$HOME/.zsh_custom"
fi
