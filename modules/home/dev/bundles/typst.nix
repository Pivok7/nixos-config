{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.dev.bundle.typst;
in
{
  options.modHome.dev.bundle.typst = {
    enable = lib.mkEnableOption "Typst bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHome.dev.lsp.typst.enable = true;
    modHome.dev.fmt.typst.enable = true;
    home.packages = with pkgs; [
      typst
    ];
  };
}
