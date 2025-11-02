{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modDev.yazi;
in
{
  options.modDev.yazi = {
    enable = lib.mkEnableOption "Enable Yazi file explorer";
  };

  config = lib.mkIf (cfg.enable) {
    environment.systemPackages = [
      pkgs.yazi
    ];
  };
}
