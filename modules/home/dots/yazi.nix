{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.modHome.dots.yazi;
in
{
  options.modHome.dots.yazi = {
    enable = lib.mkEnableOption "Setup yazi";
    dragAndDrop.enable = lib.mkEnableOption "Enable drag and drop";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = lib.concatLists [
      [
        pkgs.yazi
        pkgs.ripgrep
        pkgs.fd
      ]
      (if cfg.dragAndDrop.enable then [ pkgs.dragon-drop ] else [ ])
    ];

    home.file.".config/yazi" = {
      source = ./yazi;
    };
  };
}
