command -v kubectl >/dev/null || return

function kc() {
  export KUBECONFIG="${HOME}/.kube/kubeconf-$1"
}

[[ -d "$HOME/.kube" ]] || return

autoload -Uz compinit
if ! whence -w compdef > /dev/null 2>&1; then
  compinit -C
fi

function _kc_kube_configs() {
  local -a configs

  configs=(~/.kube/kubeconf-*(N:t))
  configs=(${configs#kubeconf-})

  compadd -- "${configs[@]}"
}

compdef _kc_kube_configs kc
