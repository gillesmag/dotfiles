export EDITOR="vim"
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

shell_path_prepend() {
  case ":${PATH:-}:" in
    *":$1:"*) ;;
    *) PATH="$1${PATH:+:$PATH}" ;;
  esac
  export PATH
}

shell_path_prepend "$HOME/.local/bin"
shell_path_prepend "$HOME/.bin"

# Keep command-line editing enabled after exporting EDITOR=vim.
set -o emacs
