{
  config,
  lib,
  ...
}:

let
  cfg = config.modSys.pipewire;
in
{
  options.modSys.pipewire = {
    enable = lib.mkEnableOption "Enable Pipewire";
  };

  config = lib.mkIf (cfg.enable) {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
    };
  };
}
