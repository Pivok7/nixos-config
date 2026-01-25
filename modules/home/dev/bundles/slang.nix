{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.dev.bundle.slang;
in
{
  options.modHome.dev.bundle.slang = {
    enable = lib.mkEnableOption "Shader slang bundle";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      shader-slang
    ];
  };
}
