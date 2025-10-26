{
    description = "My Flake";

    inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
	nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    };

    outputs = { nixpkgs, nixpkgs-unstable, ... }:
	let
	    system = "x86_64-linux";
	    lib = nixpkgs.lib;
	    pkgs = nixpkgs.legacyPackages.${system};
	    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
	in {
	    nixosConfigurations.home-pc = nixpkgs.lib.nixosSystem {
		inherit system;
		modules = [
		    ./hosts/home-pc/configuration.nix
		    ./modules/root.nix
		];
		specialArgs = {
		    inherit pkgs-unstable;
		};
	    };
	};
}
