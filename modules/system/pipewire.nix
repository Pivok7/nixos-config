{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modSys.pipewire;
in
{
  options.modSys.pipewire = {
    enable = lib.mkEnableOption "Enable Pipewire";
    gui.enable = lib.mkEnableOption "Enable pwvucontrol";
  };

  config = {
    security.rtkit.enable = cfg.enable;
    services.pipewire = {
      enable = cfg.enable;
      alsa.enable = cfg.enable;
      alsa.support32Bit = cfg.enable;
      jack.enable = cfg.enable;
    };

    environment = {
      systemPackages = lib.concatLists [
        (if cfg.gui.enable then [ pkgs.pwvucontrol ] else [ ])
      ];
    };
  };
}
