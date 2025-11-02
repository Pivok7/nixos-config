{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modTools.qbittorrent;
in
{
  options.modTools.qbittorrent = {
    enable = lib.mkEnableOption "Enable Qbittorrent client";
  };

  config = lib.mkIf (cfg.enable) {
    environment.systemPackages = [
      pkgs.qbittorrent
    ];
  };
}
