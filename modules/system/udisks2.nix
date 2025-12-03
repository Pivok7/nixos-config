{
  config,
  lib,
  ...
}:

let
  cfg = config.modSys.udisks2;
in
{
  options.modSys.udisks2 = {
    enable = lib.mkEnableOption "Enable udisks2";
  };

  config = lib.mkIf (cfg.enable) {
    services.udisks2.enable = true;
  };
}
