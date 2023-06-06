{
  description = "Minimal flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mkAlias = {
      url = "github:reckenrode/mkAlias";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, mkAlias }@inputs: {
    darwinConfigurations = {
      kamino = nix-darwin.lib.darwinSystem {
        inherit inputs;
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
  };
}
