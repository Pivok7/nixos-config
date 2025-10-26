{ config, lib, pkgs, ... }:

let
    cfg = config.modDev.bundle.c;
in
{
    imports = [
	../lsp.nix
    ];

    options.modDev.bundle.c = {
	enable = lib.mkEnableOption "C/C++ bundle";
    };

    config = lib.mkIf (cfg.enable) {
	modDev.lsp.c.enable = true;
	environment = {
	    systemPackages = with pkgs; [
		pkgs.gcc
		pkgs.gnumake
	    ];
	};
    };
}
