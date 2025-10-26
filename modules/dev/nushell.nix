{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modDev.nushell;
in
{
  options.modDev.nushell = {
    enable = lib.mkEnableOption "Enable Nushell shell";
  };

  config = lib.mkIf (cfg.enable) {
    environment = {
      systemPackages = [ pkgs.nushell ];
    };
  };
}
