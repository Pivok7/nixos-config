{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.tools.typst;
in
{
  options.modHome.tools.typst = {
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
