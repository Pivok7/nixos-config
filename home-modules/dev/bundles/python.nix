{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.homeModDev.bundle.python;
in
{
  options.homeModDev.bundle.python = {
    enable = lib.mkEnableOption "Python bundle";
  };

  config = lib.mkIf (cfg.enable) {
    homeModDev.lsp.python.enable = true;
    homeModDev.fmt.python.enable = true;
    home.packages = with pkgs; [
      python3
    ];
  };
}
