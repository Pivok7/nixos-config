{
  description = "My Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    my-modules = {
      url = "git+https://codeberg.org/Pivok/nix-modules";
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
