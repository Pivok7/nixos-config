{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHomeGaming.rpcs3;
in
{
  options.modHomeGaming.rpcs3 = {
    enable = lib.mkEnableOption "Enable rpcs3 - PS3 emulator";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.rpcs3
    ];
  };
}
