{
  description = "Home Manager configuration of goose";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl = {
      url = "github:guibou/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim-config = {
      url = "github:goosethedev/shima";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixgl, nixvim-config, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;

        overlays = [
          nixgl.overlay

          (final: prev: {
            nixvim-custom = nixvim-config.packages.${system}.default;
          })
        ];
      };
    in {
      homeConfigurations."goose" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
