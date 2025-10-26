{ config, lib, pkgs, ... }:

let
    cfg = config.modDev.bundle.web;
in
{
    imports = [
	../lsp.nix
    ];

    options.modDev.bundle.web = {
	enable = lib.mkEnableOption "Web development bundle";
    };

    config = lib.mkIf (cfg.enable) {
	modDev.lsp.typescript.enable = true;
	environment = {
	    systemPackages = with pkgs; [
		live-server
		typescript
	    ];
	};
    };
}
