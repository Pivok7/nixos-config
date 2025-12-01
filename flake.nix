{
  description = "My Flake";

  inputs = {
    nixpkgs-25-05.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur-pivok = {
      url = "github:Pivok7/nur-packages/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      d = "d";
      overlay-nur-pivok = {
        nixpkgs.overlays = [
          (final: prev: {
            nur-pivok = inputs.nur-pivok.packages."${prev.stdenv.hostPlatform.system}";
          })
        ];
      };
    in
    {
      nixosConfigurations.family-pc = nixpkgs.lib.nixosSystem {
        modules = [
          overlay-nur-pivok
          ./hosts/family-pc/configuration.nix
        ];
        specialArgs = {
	  inherit inputs;
          inherit home-manager;
        };
      };

      nixosConfigurations.lianli = nixpkgs.lib.nixosSystem {
        modules = [
          overlay-nur-pivok
          ./hosts/lianli/configuration.nix
        ];
        specialArgs = {
	  inherit inputs;
          inherit home-manager;
        };
      };

      nixosConfigurations.vm-dev = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/vm-dev/configuration.nix
        ];
        specialArgs = {
	  inherit inputs;
          inherit home-manager;
        };
      };
    };
}
