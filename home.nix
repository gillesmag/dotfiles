{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "gm";
  home.homeDirectory = "/Users/gm";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.htop
    pkgs.tree
    pkgs.tmux
    pkgs.wget
    pkgs.tokei
    pkgs.jq
    pkgs.shellcheck
    pkgs.gh
    pkgs.fzf

    # Neo-unix tools
    pkgs.fd
    pkgs.ripgrep
    pkgs.delta
    pkgs.exa
    pkgs.bat
    pkgs.zoxide
    pkgs.just
    
    # UI applications
    pkgs.alacritty

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/nvim".source = config/nvim;
    ".config/alacritty".source = config/alacritty;
    ".config/zsh".source = config/zsh;
    ".config/tmux/tmux.conf".source = config/tmux/tmux.conf;
    ".zshrc".text = ''
      source $HOME/.config/zsh/zshrc.sh
    '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/gm/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.git = {
    enable = true;
    
    includes = [
      { path = "~/.gitlocalconfig"; }
    ];

    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
      br = "branch";
    };

    extraConfig = {
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

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
