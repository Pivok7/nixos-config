{ config, lib, pkgs-unstable, ... }:

let
    cfg = config.modDev.bundle.favourite;
in
{
    imports = [
	../lsp.nix
	./root.nix
    ];

    options.modDev.bundle.favourite = {
	enable = lib.mkEnableOption "My favourite bundle";
    };

    config = lib.mkIf (cfg.enable) {
	modDev.neovim.enable = true;
	modDev.lsp.nix.enable = true;
	modDev.lsp.lua.enable = true;
	modDev.bundle.c.enable = true;
	modDev.bundle.zig.enable = true;
	modDev.bundle.rust.enable = true;
	modDev.bundle.python.enable = true;
    };
}
