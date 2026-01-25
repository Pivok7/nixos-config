{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modSys.printer;
in
{
  options.modSys.printer = {
    enable = lib.mkEnableOption "Enable printer support";
  };

  config = lib.mkIf (cfg.enable) {
    # Enable printer autodiscovery
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    # Enable CUPS to print documents.
    services.printing = {
      enable = true;
      drivers = with pkgs; [
        cups-filters
        cups-browsed
      ];
    };
  };
}
