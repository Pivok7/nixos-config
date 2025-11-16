{
  description = "My Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
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
      nixpkgs-unstable,
      home-manager,
      nur-pivok,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
      overlay-nur-pivok = {
        nixpkgs.overlays = [
          (final: prev: {
            nur-pivok = nur-pivok.packages."${prev.system}";
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
          inherit pkgs-unstable;
          inherit home-manager;
        };
      };

      nixosConfigurations.lianli = nixpkgs.lib.nixosSystem {
        modules = [
	  overlay-nur-pivok
          ./hosts/lianli/configuration.nix
        ];
        specialArgs = {
          inherit pkgs-unstable;
          inherit home-manager;
        };
      };

      nixosConfigurations.vm-dev = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/vm-dev/configuration.nix
        ];
        specialArgs = {
          inherit pkgs-unstable;
          inherit home-manager;
        };
      };
    };
}
