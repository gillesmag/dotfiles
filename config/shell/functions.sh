md() {
  mkdir -p "$1" || return
  cd "$1" || return
}
