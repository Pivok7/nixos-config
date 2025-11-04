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
    modDev.terminal.kitty.enable = lib.mkDefault true;
    modDev.shell.nushell.enable = lib.mkDefault true;

    modDev.versioning = {
      git.enable = true;
      lazygit.enable = true;
    };

    modDev.yazi.enable = lib.mkDefault true;

    modDev.bundle.neovim.enable = lib.mkDefault true;

    modDev.bundle = {
      nix.enable = lib.mkDefault true;
      c.enable = lib.mkDefault true;
      zig.enable = lib.mkDefault true;
      rust.enable = lib.mkDefault true;
      python.enable = lib.mkDefault true;
      lua.enable = lib.mkDefault true;
    };
  };
}
