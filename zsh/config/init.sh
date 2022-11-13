# If ZSH is not defined, use the current script's directory.
[[ -z "$ZSH" ]] && export ZSH="${${(%):-%x}:a:h}"

for plugin ($plugins); do
  if [[ -f "$ZSH/plugins/$plugin.plugin.zsh" ]]; then
    source "$ZSH/plugins/$plugin.plugin.zsh"
  fi
done
unset plugin

source $ZSH/aliases.zsh

if [[ -f "$HOME/.zsh_custom" ]]; then
  source "$HOME/.zsh_custom"
fi
