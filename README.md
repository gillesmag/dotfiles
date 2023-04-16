# `dotfiles`

- Editor: [`nvim`](https://neovim.io/)
- Terminal: [`Alacritty`](https://github.com/alacritty/alacritty)
- Font: [SFMono Nerd Font](https://github.com/epk/SF-Mono-Nerd-Font)

- Colorscheme: [Tokyo Night](https://github.com/folke/tokyonight.nvim)

Goals:
- Fast (zsh startup < 100ms)

# macOS

```
# Ctrl + Cmd to move window
# Source: https://mmazzarolo.com/blog/2022-04-16-drag-window-by-clicking-anywhere-on-macos/
defaults write -g NSWindowShouldDragOnGesture -bool true

defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.3
killall Dock

# VSCode disable PressAndHold
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```
