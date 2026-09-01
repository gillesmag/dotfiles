# `dotfiles`

- Terminal: [`Ghostty`](https://ghostty.org/)

Goals:

- Fast shell startup under 100 ms

# Setup

```
sudo -H nix run .#darwin-rebuild -- switch --flake .#kamino
# or:
just switch
```
