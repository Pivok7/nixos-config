{
  lib,
  config,
  ...
}:

let
  cfg = config.modHomeDots.hyprland;
in
{
  options.modHomeDots.hyprland = {
    enable = lib.mkEnableOption "Setup hyrpland";
  };

  config = lib.mkIf (cfg.enable) {
    home.file.".config/hypr/hyprland.conf" = {
      source = ./hyprland.conf;
    };
  };
}
