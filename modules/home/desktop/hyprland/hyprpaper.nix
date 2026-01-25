{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHomeDesktop.hyprpaper;

  hyprpaperConfig = ''
    ipc = ${if cfg.ipc then "on" else "off"}

    preload = ${cfg.wallpaper}
    wallpaper = ,${cfg.wallpaper}
  '';
in
{
  options.modHomeDesktop.hyprpaper = {
    enable = lib.mkEnableOption "Setup hyprpaper";
    wallpaper = lib.mkOption {
      type = lib.types.str;
      default = null;
      example = ''"/home/user/wallpaper.png"'';
      description = "Set wallpaper path (must be a string)";
    };
    ipc = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Set ipc option";
    };
  };

  config = lib.mkIf (cfg.enable) {
    assertions = [
      {
        assertion = (cfg.wallpaper != null);
        message = "hyprpaper.wallpaper must be set";
      }
    ];

    home.packages = [
      pkgs.hyprpaper
    ];

    home.file.".config/hypr/hyprpaper.conf".text = lib.trim hyprpaperConfig;
  };
}
