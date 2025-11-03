{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modDesktop.hyprland;
in
{
  options.modDesktop.hyprland = {
    enable = lib.mkEnableOption "Enable Hyprland WM";
  };

  config = lib.mkIf (cfg.enable) {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
}
