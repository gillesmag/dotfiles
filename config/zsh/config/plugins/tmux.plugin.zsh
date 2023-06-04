# t: act as a shortcut for tmux when invoked with arguments, or attach to a
# session named after the current directory when invoked without arguments.
function t() {
  if [ "$#" -gt 0 ]; then
    tmux $@
  else
    session_name="$(basename $(pwd))"
    session_exists=$(tmux ls -F '#S' | grep $session_name > /dev/null)
    if [ $? -eq 0 ]; then
      tmux attach -t $session_name
    else
      tmux new -s $session_name
    fi
  fi
}
