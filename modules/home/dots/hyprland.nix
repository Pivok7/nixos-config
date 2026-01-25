{
  lib,
  config,
  ...
}:

let
  cfg = config.modHome.dots.hyprland;
in
{
  options.modHome.dots.hyprland = {
    enable = lib.mkEnableOption "Setup hyrpland";
  };

  config = lib.mkIf (cfg.enable) {
    home.file.".config/hypr/hyprland.conf" = {
      source = ./hyprland.conf;
    };
  };
}
