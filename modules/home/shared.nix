{ pkgs, osConfig, ... }:
{
  imports = [
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    direnv
    devenv
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

  home.file.".local/bin/t" = {
    source = ../../bin/t;
    executable = true;
  };

  gm.zsh.aliasGroups = {
    bat = {
      c = "bat";
    };

    codex = {
      dcodex = "codex --dangerously-bypass-approvals-and-sandbox";
    };

    git = {
      g = "git";
      ga = "git add";
      gb = "git branch";
      gd = "git diff";
      gs = "git status";
      grs = "git restore --staged";
      gcm = "git commit -m";
      gds = "git diff --staged";
      gpl = "git pull";
      gpo = "git push -u origin HEAD";
      gpu = "git push";
    };

    home-manager = {
      hm = "home-manager";
    };

    kubectl = {
      k = "kubectl";
    };

    terraform = {
      tf = "terraform";
    };
  };

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
