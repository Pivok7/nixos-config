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
    home.packages = with pkgs; [
      eww
      socat
      playerctl
      pwvucontrol
      networkmanagerapplet
    ];

    home.file.".config/eww" = {
      source = ./eww;
    };
  };
}
