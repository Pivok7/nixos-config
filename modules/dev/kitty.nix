{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modDev.kitty;
in
{
  options.modDev.kitty = {
    enable = lib.mkEnableOption "Kitty terminal";
  };

  config = lib.mkIf (cfg.enable) {
    environment = {
      systemPackages = [ pkgs.kitty ];
    };
  };
}
