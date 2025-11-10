{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modSys.wine;
in
{
  options.modSys.wine = {
    enable = lib.mkEnableOption "Enable wine";
  };

  config = lib.mkIf (cfg.enable) {
    environment.systemPackages = with pkgs; [
      wineWowPackages.stable
    ];
  };
}
