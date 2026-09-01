{
  imports = [
    ../../modules/home/shared.nix
  ];

  home = {
    username = "gm";
    homeDirectory = "/home/gm";

    file.".config/tmux/tmux.conf".source = ../../config/tmux/tmux.conf;
  };

  programs = {
    home-manager.enable = true;
  };

  gm.shell = {
    enable = true;
    program = "bash";
  };
}
