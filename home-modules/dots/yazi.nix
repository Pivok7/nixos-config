{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.homeModDots.yazi;
in
{
  options.homeModDots.yazi = {
    enable = lib.mkEnableOption "Setup yazi";
    dragAndDrop.enable = lib.mkEnableOption "Enable drag and drop";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = lib.concatLists [
      [pkgs.yazi]
      (if cfg.dragAndDrop.enable then [ pkgs.dragon-drop ] else [ ])
    ];

    home.file = {
      ".config/yazi" = {
        source = ./yazi;
      };
    };
  };
}
