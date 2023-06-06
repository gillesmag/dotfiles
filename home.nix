{ config, lib, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "gm";
    homeDirectory = "/Users/gm";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "23.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = with pkgs; [
      htop
      tree
      tmux
      wget
      tokei
      jq
      shellcheck
      gh
      fzf

      # Neo-unix tools
      fd
      ripgrep
      delta
      exa
      bat
      zoxide
      just

      direnv

      cloudflared
      cmake
      
      # UI applications
      alacritty
      rectangle
      utm

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
    file = {
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
    sessionVariables = {
      # EDITOR = "emacs";
    };
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

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Copy GUI apps to "~/Applications/Home Manager Apps"
  # Based on this comment: https://github.com/nix-community/home-manager/issues/1341#issuecomment-778820334
  home.activation.darwinApps =
    if pkgs.stdenv.isDarwin then
      let
        apps = pkgs.buildEnv {
          name = "home-manager-applications";
          paths = config.home.packages;
          pathsToLink = "/Applications";
        };
      in
      lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        # Install MacOS applications to the user environment.
        HM_APPS="$HOME/Applications/Home Manager Apps"
        # Reset current state
        [ -e "$HM_APPS" ] && $DRY_RUN_CMD rm -r "$HM_APPS"
        $DRY_RUN_CMD mkdir -p "$HM_APPS"
        # .app dirs need to be actual directories for Finder to detect them as Apps.
        # In the env of Apps we build, the .apps are symlinks. We pass all of them as
        # arguments to cp and make it dereference those using -H
        $DRY_RUN_CMD cp --archive -H --dereference ${apps}/Applications/* "$HM_APPS"
        $DRY_RUN_CMD chmod +w -R "$HM_APPS"
      ''
    else
      "";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
