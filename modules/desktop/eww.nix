{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modDesktop.eww;
in
{
  options.modDesktop.eww = {
    enable = lib.mkEnableOption "Enable Eww bar";
  };

  config = lib.mkIf (cfg.enable) {
    environment.systemPackages = with pkgs; [
      eww
      socat
      pulseaudio
      playerctl
    ];
  };
}
