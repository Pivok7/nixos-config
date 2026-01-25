{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.modHome.dots.eww;
in
{
  options.modHome.dots.eww = {
    enable = lib.mkEnableOption "Setup eww";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.eww
      pkgs.socat
      pkgs.playerctl
      pkgs.networkmanagerapplet
    ];

    home.file.".config/eww" = {
      source = ./eww;
    };
  };
}
