{ config, lib, pkgs, ... }:

let
    cfg = config.modDev.bundle.rust;
in
{
    imports = [
	../lsp.nix
    ];

    options.modDev.bundle.rust = {
	enable = lib.mkEnableOption "Rust bundle";
    };

    config = lib.mkIf (cfg.enable) {
	modDev.lsp.rust.enable = true;
	environment = {
	    systemPackages = with pkgs; [
		rustc
		cargo
	    ];
	};
    };
}
