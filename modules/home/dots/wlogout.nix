{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.modHome.dots.wlogout;
in
{
  options.modHome.dots.wlogout = {
    enable = lib.mkEnableOption "Setup wlogout";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.wlogout
    ];

    home.file.".config/wlogout" = {
      source = ./wlogout;
    };
  };
}
