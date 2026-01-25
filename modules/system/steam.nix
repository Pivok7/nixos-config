# Steam only seems to work when it's installed system wide ???
# That's unfortunate

{
  config,
  lib,
  ...
}:

let
  cfg = config.modSys.steam;
in
{
  options.modSys.steam = {
    enable = lib.mkEnableOption "Enable Steam by Valve (unfree)";
  };

  config = lib.mkIf (cfg.enable) {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
  };
}
