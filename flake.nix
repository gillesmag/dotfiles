{
  description = "Minimal flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgsTmux.url = "github:NixOS/nixpkgs/b134951a4c9f3c995fd7be05f3243f8ecd65d798";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nixpkgsTmux,
      home-manager,
    }:
    let
      system = "aarch64-darwin";
      linuxSystem = "x86_64-linux";
      inherit (nix-darwin.lib) darwinSystem;
      nixpkgsConfig = {
        config = {
          allowUnfree = true;
        };
      };
      linuxPkgs = import nixpkgs {
        system = linuxSystem;
        inherit (nixpkgsConfig) config;
      };
      linuxTmuxPkgs = import nixpkgsTmux {
        system = linuxSystem;
      };
    in
    {
      apps.${system}.darwin-rebuild = {
        type = "app";
        program = "${nix-darwin.packages.${system}.darwin-rebuild}/bin/darwin-rebuild";
      };

      darwinConfigurations = rec {
        kamino = darwinSystem {
          specialArgs = { inherit self; };
          modules = [
            ./hosts/kamino/darwin.nix

            home-manager.darwinModules.home-manager
            {
              nixpkgs = nixpkgsConfig;
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.gm.imports = [
                  ./hosts/kamino/home.nix
                ];
              };
            }
          ];
        };
      };

      homeConfigurations."gm@turbo2-gmr" = home-manager.lib.homeManagerConfiguration {
        pkgs = linuxPkgs;
        modules = [
          ./hosts/turbo2-gmr/home.nix
          { gm.tmux.package = linuxTmuxPkgs.tmux; }
        ];
      };
    };
}
