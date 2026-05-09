{
  config,
  pkgs,
  self,
  ...
}:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # environment.systemPackages = with pkgs; [
  #   vim
  # ];

  time.timeZone = "Europe/Amsterdam";

  users.users.gm.home = /Users/gm;

  networking = {
    hostName = "kamino";
    localHostName = "kamino";
    computerName = "Kamino";
  };

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "none";
    };

    taps = [
      "anomalyco/tap"
      "derailed/k9s"
      "hashicorp/tap"
    ];

    brews = [
      "actionlint"
      "fnm"
      "zstd"
      "gh"
      "git-filter-repo"
      "go"
      "graphviz"
      "hcloud"
      "helm"
      {
        name = "postgresql@18";
        link = true;
      }
      "scw"
      "tilt"
      "tmux"
      "zoxide"
      "anomalyco/tap/opencode"
      "derailed/k9s/k9s"
      "hashicorp/tap/terraform"
    ];

    casks = [
      "codex"
      "iina"
      "orbstack"
      "spotify"
    ];
  };

  # Let Determinate Nix handle Nix configuration
  nix.enable = false;

  # Home Manager initializes completion after the user fpath is finalized.
  # Running compinit globally as well makes interactive startup pay twice.
  programs.zsh.enableGlobalCompInit = false;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # Required by nix-darwin for user-scoped system.defaults.
  system.primaryUser = "gm";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.3;
      tilesize = 36;
    };

    NSGlobalDomain = {
      # Ctrl + Cmd to move window.
      # Source: https://mmazzarolo.com/blog/2022-04-16-drag-window-by-clicking-anywhere-on-macos/
      NSWindowShouldDragOnGesture = true;
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
    };

    CustomUserPreferences = {
      "com.microsoft.VSCode" = {
        ApplePressAndHoldEnabled = false;
      };
    };
  };
}
