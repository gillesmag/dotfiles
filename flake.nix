{
  description = "Minimal flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, darwin, nixpkgs, home-manager, ... }@inputs:
  let
    inherit (darwin.lib) darwinSystem;
    nixpkgsConfig = {
      config = { allowUnfree = true; };
    };
  in
  {
    darwinConfigurations = rec {
      kamino = darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./system/darwin

          home-manager.darwinModules.home-manager {
            nixpkgs = nixpkgsConfig;
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.gm.imports = [ ./home/kamino ];
            };
          }
        ];
      };

      bespin = darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./system/darwin

          home-manager.darwinModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.gm.imports = [ ./home/kamino ];
            };
          }
        ];
      };
    };

    homeConfigurations.bespin = home-manager.lib.homeManagerConfiguration {
      inherit inputs;
      homeDirectory = "/Users/gm";
      configuration = ./home/kamino;
    };
  };
}
