{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modGaming.rpcs3;
in
{
  options.modGaming.rpcs3 = {
    enable = lib.mkEnableOption "Enable rpcs3 - PS3 emulator";
  };

  config = lib.mkIf (cfg.enable) {
    environment.systemPackages = [
      pkgs.rpcs3
    ];
  };
}
