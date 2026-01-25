{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHomeDev.bundle.python;
in
{
  options.modHomeDev.bundle.python = {
    enable = lib.mkEnableOption "Python bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHomeDev.lsp.python.enable = true;
    modHomeDev.fmt.python.enable = true;
    home.packages = with pkgs; [
      python3
      uv
    ];
  };
}
