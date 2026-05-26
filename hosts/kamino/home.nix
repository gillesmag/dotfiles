{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/home/shared.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "gm";

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = with pkgs; [
      # It is sometimes useful to fine-tune packages, for example, by applying
      # overrides. You can do that directly here, just don't forget the
      # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # fonts?
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      # You can also create simple shell scripts directly inside your
      # configuration. For example, this adds a command 'my-hello' to your
      # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      #   ".bin".source = ../../bin;
      ".config/tmux/tmux.conf".source = ../../config/tmux/tmux.conf;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  gm.zsh.enable = true;

  gm.zsh.extraAliases = {
    ls = "ls -G";
    ll = "ls -lahG";
    turbo = "ssh turbo";
    turbo2 = "ssh turbo2";
  };
}
