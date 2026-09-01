command -v kubectl >/dev/null || return

kc() {
  if [ "$#" -ne 1 ]; then
    printf 'usage: kc <name>\n' >&2
    return 1
  fi

  export KUBECONFIG="$HOME/.kube/kubeconf-$1"
}

[ -d "$HOME/.kube" ] || return

_kc_kube_configs() {
  local config completion current
  local -a configs

  configs=()
  for config in "$HOME"/.kube/kubeconf-*; do
    [ -e "$config" ] || continue
    config=${config##*/}
    configs+=("${config#kubeconf-}")
  done

  if [ "$GM_SHELL_NAME" = "zsh" ]; then
    compadd -- "${configs[@]}"
    return
  fi

  COMPREPLY=()
  current=${COMP_WORDS[COMP_CWORD]}
  while IFS= read -r completion; do
    COMPREPLY+=("$completion")
  done < <(compgen -W "${configs[*]}" -- "$current")
}

if [ "$GM_SHELL_NAME" = "zsh" ]; then
  autoload -Uz compinit
  if ! whence -w compdef >/dev/null 2>&1; then
    compinit -C
  fi
  compdef _kc_kube_configs kc
else
  complete -F _kc_kube_configs kc
fi
