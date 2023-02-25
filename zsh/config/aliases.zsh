function md() {
  mkdir -p "$1" && cd "$1"
}

alias v="fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim"
