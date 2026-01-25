{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.tui.nushell;

  nushellConfig = ''
    $env.config.show_banner = false
    $env.config.edit_mode = 'vi'
    $env.EDITOR = 'nvim'

    ${if cfg.hyprsunset.enable then "alias hsct = hyprctl hyprsunset temperature" else ""}
  '';
in
{
  options.modHome.tui.nushell = {
    enable = lib.mkEnableOption "Setup nushell";
    hyprsunset.enable = lib.mkEnableOption "Add hsct alias";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.nushell
    ];

    home.file.".config/nushell/config.nu" = {
      text = lib.trim nushellConfig;
    };
  };
}
