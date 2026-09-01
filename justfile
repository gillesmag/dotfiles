set dotenv-load := true

platform := `uname -s`
host := env_var_or_default("DOTFILES_HOST", `hostname -s`)
user := env_var_or_default("DOTFILES_USER", `id -un`)
flake := env_var_or_default("DOTFILES_FLAKE", "path:.")
home_config := user + "@" + host
configuration := if platform == "Darwin" {
  flake + "#darwinConfigurations." + host + ".system"
} else {
  flake + "#homeConfigurations.\"" + home_config + "\".activationPackage"
}

default:
  @just --list

check:
  nix flake check --no-build '{{flake}}'
  nix eval --raw '{{configuration}}.drvPath' >/dev/null

build:
  nix build --no-link --print-out-paths '{{configuration}}'

switch:
  #!/usr/bin/env bash
  set -euo pipefail

  case '{{platform}}' in
    Darwin)
      sudo -H nix run '{{flake}}#darwin-rebuild' -- switch --flake '{{flake}}#{{host}}'
      ;;
    Linux)
      generation=$(nix build --no-link --print-out-paths '{{configuration}}')
      HOME_MANAGER_BACKUP_EXT=home-manager-backup "$generation/activate"
      ;;
    *)
      printf 'Unsupported platform: %s\n' '{{platform}}' >&2
      exit 1
      ;;
  esac

fmt:
  fd .nix | xargs nixfmt
