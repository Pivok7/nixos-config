{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modDev.terminal;
in
{
  options.modDev.terminal = {
    kitty.enable = lib.mkEnableOption "Enable Kitty terminal";
  };

  config = {
    environment = {
      systemPackages = lib.concatLists [
        (if cfg.kitty.enable then [ pkgs.kitty ] else [ ])
      ];
    };
  };
}
