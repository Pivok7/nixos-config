{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHomeMedia.nomacs;
in
{
  options.modHomeMedia.nomacs = {
    enable = lib.mkEnableOption "Enable nomacs";
    defaultViewer = lib.mkEnableOption "Set as default image viewer";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.nomacs
    ];
    modHomeMedia.mime.image.default = (
      if cfg.defaultViewer then "org.nomacs.ImageLounge.desktop" else ""
    );
  };
}
