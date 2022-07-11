FOUND_PYENV=$(command -v pyenv &>/dev/null; echo $?)

if [[ $FOUND_PYENV -eq 1 ]]; then
  return
fi

if [[ -z "$PYENV_ROOT" ]]; then
  export PYENV_ROOT="$(pyenv root)"
fi

_init_pyenv() {
  unset -f pyenv python _init_pyenv
  # Add pyenv shims to $PATH if not already added
  if [[ -z "${path[(Re)$(pyenv root)/shims]}" ]]; then
    eval "$(pyenv init --path)"
  fi

  # Load pyenv
  eval "$(pyenv init - --no-rehash zsh)"

  # If pyenv-virtualenv exists, load it
  if [[ "$(pyenv commands)" =~ "virtualenv-init" && "$ZSH_PYENV_VIRTUALENV" != false ]]; then
    eval "$(pyenv virtualenv-init - zsh)"
  fi
}

pyenv() {
  _init_pyenv
  pyenv "$@"
}

python() {
  _init_pyenv
  python "$@"
}
