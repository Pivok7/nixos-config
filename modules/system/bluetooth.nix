{
  config,
  lib,
  ...
}:

let
  cfg = config.modSys.bluetooth;
in
{
  options.modSys.bluetooth = {
    enable = lib.mkEnableOption "Enable bluetooth";
    gui.enable = lib.mkEnableOption "Enable blueman";
  };

  config = {
    hardware.bluetooth = {
      enable = cfg.enable;
      powerOnBoot = cfg.enable;
      settings = {
        General = {
          Experimental = cfg.enable;
        };
      };
    };
    services.blueman.enable = cfg.gui.enable;
  };
}
