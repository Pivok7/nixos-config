{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHomeMedia.zathura;

  zathuraConfig = ''
    set selection-clipboard clipboard
  '';
in
{
  options.modHomeMedia.zathura = {
    enable = lib.mkEnableOption "Setup zathura";
    defaultPdfViewer = lib.mkEnableOption "Set as default pdf viewer";

    clipboard = lib.mkOption {
      type = lib.types.str;
      default = "clipboard";
      description = "Set font selection-clipboard option";
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.zathura
    ];
    modHomeMedia.mime.pdf.default = (if cfg.defaultPdfViewer then "org.pwmt.zathura.desktop" else "");

    home.file.".config/zathura/zathurarc".text = lib.trim zathuraConfig;
  };
}
