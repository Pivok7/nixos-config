{
  description = "My Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in
    {
      nixosConfigurations.family-pc = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/family-pc/configuration.nix
        ];
        specialArgs = {
          inherit pkgs-unstable;
          inherit home-manager;
        };
      };

      nixosConfigurations.lianli = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/lianli/configuration.nix
        ];
        specialArgs = {
          inherit pkgs-unstable;
          inherit home-manager;
        };
      };
    };
}
