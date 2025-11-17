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
  };

  config = lib.mkIf (cfg.enable) {
    services.blueman.enable = true;
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };
  };
}
