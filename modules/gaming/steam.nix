{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modGaming.steam;
in
{
  options.modGaming.steam = {
    enable = lib.mkEnableOption "Enable Steam by Valve";
  };

  config = lib.mkIf (cfg.enable) {
    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "steam"
        "steam-original"
        "steam-unwrapped"
        "steam-run"
      ];
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
  };
}
