set dotenv-load := true

darwin_config := env_var_or_default("DARWIN_CONFIG", "kamino")
flake := ".#" + darwin_config
system := ".#darwinConfigurations." + darwin_config + ".system"

default:
  @just --list

check:
  nix flake check --no-build

build:
  nix build --no-link --print-out-paths {{system}}

switch:
  sudo -H nix run .#darwin-rebuild -- switch --flake {{flake}}

fmt:
  fd .nix | xargs nixfmt
