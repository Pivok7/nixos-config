{
  description = "My Flake";

  inputs = {
    self.submodules = true;
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
      nixosConfigurations.home-pc = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/home-pc/configuration.nix
          ./modules/root.nix
        ];
        specialArgs = {
          inherit pkgs-unstable;
          inherit home-manager;
        };
      };
    };
}
