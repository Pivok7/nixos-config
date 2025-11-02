{
  config,
  lib,
  ...
}:

let
  cfg = config.modDev.bundle.favourite;
in
{
  options.modDev.bundle.favourite = {
    enable = lib.mkEnableOption "My favourite bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modDev.kitty.enable = lib.mkDefault true;
    modDev.yazi.enable = lib.mkDefault true;
    modDev.nushell.enable = lib.mkDefault true;

    modDev.neovim.enable = lib.mkDefault true;
    modDev.neovim.defaultEditor = lib.mkDefault true;

    modDev.bundle.nix.enable = lib.mkDefault true;
    modDev.bundle.c.enable = lib.mkDefault true;
    modDev.bundle.zig.enable = lib.mkDefault true;
    modDev.bundle.rust.enable = lib.mkDefault true;
    modDev.bundle.python.enable = lib.mkDefault true;
    modDev.bundle.lua.enable = lib.mkDefault true;
  };
}
