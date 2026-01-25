{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.dev.bundle.python;
in
{
  options.modHome.dev.bundle.python = {
    enable = lib.mkEnableOption "Python bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHome.dev.lsp.python.enable = true;
    modHome.dev.fmt.python.enable = true;
    home.packages = with pkgs; [
      python3
      uv
    ];
  };
}
