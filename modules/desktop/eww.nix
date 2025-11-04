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
    nixpkgs.config.pulseaudio = true;
    environment.systemPackages = with pkgs; [
      eww
      socat
    ];
  };
}
