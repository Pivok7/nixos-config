{ config, lib, pkgs-unstable, ... }:

let
    cfg = config.modDev.bundle.zig;
in
{
    imports = [
	../lsp.nix
    ];

    options.modDev.bundle.zig = {
	enable = lib.mkEnableOption "Zig bundle";
    };

    config = lib.mkIf (cfg.enable) {
	modDev.lsp.zig.enable = true;
	environment = {
	    systemPackages = with pkgs-unstable; [
		zig
	    ];
	};
    };
}
