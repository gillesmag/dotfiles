# `dotfiles`

- Terminal: [`Ghostty`](https://ghostty.org/)

Goals:
- Fast (zsh startup < 100ms)

# Setup

```
sudo -H nix run .#darwin-rebuild -- switch --flake .#kamino
# or:
just switch
```
