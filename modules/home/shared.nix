{ pkgs, osConfig, ... }:
{
  home.packages = with pkgs; [
    direnv
    bat
    htop
    tree
    tmux
    wget
    tokei
    yq
    jq
    gh
    fzf
    shellcheck
    fd
    delta
    ripgrep
    zoxide
    just
    vim
    nixfmt
  ];

  programs.git = {
    enable = true;

    includes = [
      { path = "~/.gitlocalconfig"; }
    ];

    settings = {
      init.defaultBranch = "main";
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta = {
        navigate = true;
        light = false;
      };
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # initial home-manager state
}
