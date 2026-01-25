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
    powerOnBoot = lib.mkEnableOption "Enable bluetooth on boot";
  };

  config = lib.mkIf (cfg.enable) {
    services.blueman.enable = true;
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = cfg.powerOnBoot;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };
  };
}
