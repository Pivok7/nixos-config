{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHomeMedia.zathura;
in
{
  options.modHomeMedia.zathura = {
    enable = lib.mkEnableOption "Setup zathura";
    defaultPdfViewer = lib.mkEnableOption "Set as default pdf viewer";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.zathura
    ];
    modHomeMedia.mime.pdf.default = (
      if cfg.defaultPdfViewer then "org.pwmt.zathura.desktop" else ""
    );
  };
}
