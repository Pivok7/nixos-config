{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.homeModDots.eww;
in
{
  options.homeModDots.eww = {
    enable = lib.mkEnableOption "Setup eww";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.eww
    ];

    home.file = {
      ".config/eww" = {
        source = ./eww;
      };
    };
  };
}
