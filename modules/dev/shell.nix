{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modDev.shell;
in
{
  options.modDev.shell = {
    nushell.enable = lib.mkEnableOption "Enable Nushell shell";
  };

  config = {
    environment = {
      systemPackages = lib.concatLists [
        (if cfg.nushell.enable then [ pkgs.nushell ] else [ ])
      ];
    };
  };
}
