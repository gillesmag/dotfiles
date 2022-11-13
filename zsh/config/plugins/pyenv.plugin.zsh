export PYENV_ROOT="$HOME/.pyenv"

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init - --no-rehash zsh)"
eval "$(pyenv virtualenv-init - zsh)"
