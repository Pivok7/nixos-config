{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.dev.bundle.rocq;
in
{
  options.modHome.dev.bundle.rocq = {
    enable = lib.mkEnableOption "Rocq bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHome.dev.lsp = {
      rocq.enable = true;
    };
    home.packages = with pkgs; [
      rocq-core
    ];
  };
}
