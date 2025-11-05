{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.homeModDots.yazi;
in
{
  options.homeModDots.yazi = {
    enable = lib.mkEnableOption "Setup yazi";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.yazi
      pkgs.dragon-drop
    ];

    home.file = {
      ".config/yazi" = {
        source = ./yazi;
      };
    };
  };
}
