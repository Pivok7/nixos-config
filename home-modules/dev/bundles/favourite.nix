{
  config,
  lib,
  ...
}:

let
  cfg = config.homeModDev.bundle.favourite;
in
{
  options.homeModDev.bundle.favourite = {
    enable = lib.mkEnableOption "My favourite dev bundle";
  };

  config = lib.mkIf (cfg.enable) {
    homeModDev.bundle = {
      nix.enable = lib.mkDefault true;
      c.enable = lib.mkDefault true;
      zig.enable = lib.mkDefault true;
      rust.enable = lib.mkDefault true;
      python.enable = lib.mkDefault true;
      lua.enable = lib.mkDefault true;
    };
  };
}
