# `dotfiles`

- Editor: `nvim`
- Terminal: `iTerm`
- Font: [JetBrainsMono Nerd Font](https://nerdfonts.com/font-downloads)

- Colorscheme: [Tokyo Night](https://github.com/folke/tokyonight.nvim)

Goals:
- Fast (zsh startup < 100ms)

TODOs:
- GitHub action to benchmark zsh startup time

# macOS

```
# Ctrl + Cmd to move window
# Source: https://mmazzarolo.com/blog/2022-04-16-drag-window-by-clicking-anywhere-on-macos/
defaults write -g NSWindowShouldDragOnGesture -bool true

defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.3
killall Dock
```
