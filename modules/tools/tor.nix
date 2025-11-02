{
  config,
  lib,
  pkgs-unstable,
  ...
}:

let
  cfg = config.modTools.tor;
in
{
  options.modTools.tor = {
    enable = lib.mkEnableOption "Tor browser";
  };

  config = lib.mkIf (cfg.enable) {
    environment.systemPackages = [
      pkgs-unstable.tor-browser
    ];
  };
}
