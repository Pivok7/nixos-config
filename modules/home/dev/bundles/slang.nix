{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHomeDev.bundle.slang;
in
{
  options.modHomeDev.bundle.slang = {
    enable = lib.mkEnableOption "Shader slang bundle";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      shader-slang
    ];
  };
}
