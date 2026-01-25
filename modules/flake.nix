{
  description = "My nix modules";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };
  outputs =
    { self, nixpkgs }:
    {
      nixosModules.default = [
        ./default.nix
      ];
    };
}
