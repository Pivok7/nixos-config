{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.homeModDots.hyprland;
in
{
  options.homeModDots.hyprland = {
    enable = lib.mkEnableOption "Setup hyrpland";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.hyprland
    ];

    home.file = {
      ".config/hypr/hyprland.conf" = {
        source = ./hyprland.conf;
      };
    };
  };
}
