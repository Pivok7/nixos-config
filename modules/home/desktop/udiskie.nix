{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.desktop.udiskie;

  udiskieConfig = ''
    program_options:
      automount: true
      file_manager: ${cfg.file_manager}
      notify: true
      tray: ${cfg.tray}
  '';
in
{
  options.modHome.desktop.udiskie = {
    enable = lib.mkEnableOption "Enable udiskie";
    tray = lib.mkOption {
      type = lib.types.str;
      default = "true";
      description = "Choose when to display tray icon {'true', 'auto', 'false'}";
    };
    file_manager = lib.mkOption {
      type = lib.types.str;
      default = "${pkgs.kitty}/bin/kitty";
      description = "Set default file manager";
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.udiskie
    ];

    home.file.".config/udiskie/config.yml".text = lib.trim udiskieConfig;
  };
}
