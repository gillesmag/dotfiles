{
  description = "Minimal flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
    }:
    let
      system = "aarch64-darwin";
      inherit (nix-darwin.lib) darwinSystem;
      nixpkgsConfig = {
        config = {
          allowUnfree = true;
        };
      };
      pkgs = import nixpkgs {
        inherit system;
        inherit (nixpkgsConfig) config;
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
                  ./modules/home/shared.nix
                  ./modules/home/zsh.nix
                ];
              };
            }
          ];
        };
      };
    };
}
