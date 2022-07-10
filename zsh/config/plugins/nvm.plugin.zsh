NVM_USE_HOMEBREW=1

if [[ -z "$NVM_DIR" ]]; then
  if [[ -d "$HOME/.nvm" ]]; then
    export NVM_DIR="$HOME/.nvm"
  fi
fi

# Don't try to load nvm if command already available
# Note: nvm is a function so we need to use `which`
! which nvm &>/dev/null || return

# Skip adding binaries if there is no node version installed yet
if [ -d $NVM_DIR/versions/node ]; then
  NODE_GLOBALS=(`find $NVM_DIR/versions/node -maxdepth 3 \( -type l -o -type f \) -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
fi
NODE_GLOBALS+=("nvm")

load_nvm () {
  # Unset placeholder functions
  for cmd in "${NODE_GLOBALS[@]}"; do unset -f ${cmd} &>/dev/null; done

  # Load NVM
  if (( $+NVM_USE_HOMEBREW )); then
    # Otherwise try to load nvm installed via Homebrew
    # User can set this if they have an unusual Homebrew setup
    NVM_HOMEBREW="${NVM_HOMEBREW:-${HOMEBREW_PREFIX:-$(brew --prefix)}/opt/nvm}"
    # Load nvm from Homebrew location if it exists
    if [[ -f "$NVM_HOMEBREW/nvm.sh" ]]; then
      source "$NVM_HOMEBREW/nvm.sh" ${NVM_LAZY+"--no-use"}
    else
      return
    fi
  elif [[ -f "$NVM_DIR/nvm.sh" ]]; then
    # Load nvm if it exists in $NVM_DIR
    source "$NVM_DIR/nvm.sh" ${NVM_LAZY+"--no-use"}
  else
    return
  fi

  # (Optional) Set the version of node to use from ~/.nvmrc if available
  nvm use 2> /dev/null 1>&2 || true

  # Do not reload nvm again
  export NVM_LOADED=1
}

# Call nvm when first using node, npm or yarn
for cmd in "${NODE_GLOBALS[@]}"; do
  # Skip defining the function if the binary is already in the PATH
  if ! which ${cmd} &>/dev/null; then
    eval "${cmd}() { unset -f ${cmd} &>/dev/null; [ -z \${NVM_LOADED+x} ] && load_nvm; ${cmd} \$@; }"
  fi
done
