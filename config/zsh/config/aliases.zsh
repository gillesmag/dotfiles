function md() {
  mkdir -p "$1" && cd "$1"
}

export PATH="$HOME/.bin:$PATH"

alias v="fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim"
