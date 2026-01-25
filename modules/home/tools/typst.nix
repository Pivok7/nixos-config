{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHomeTools.typst;
in
{
  options.modHomeTools.typst = {
    enable = lib.mkEnableOption "Enable typst";
    lsp.enable = lib.mkEnableOption "Enable typst LSP";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = lib.concatLists [
      [ pkgs.typst ]
      (if cfg.lsp.enable then [ pkgs.tinymist ] else [ ])
    ];
  };
}
