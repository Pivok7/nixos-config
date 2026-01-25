{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.modHomeDots.eww;
in
{
  options.modHomeDots.eww = {
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
