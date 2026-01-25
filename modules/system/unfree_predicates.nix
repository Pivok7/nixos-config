{
  config,
  lib,
  ...
}:

let
  cfg = config.modSys.unfreePred;
  predicates = {
    nvidia = [
      "nvidia-x11"
      "nvidia-settings"
      "nvidia-persistanced"
    ];
    steam = [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];
    discord = [
      "discord"
    ];
    reaper = [
      "reaper"
    ];
  };
in
{
  options.modSys.unfreePred = {
    nvidia.enable = lib.mkEnableOption "Enable unfree license for Nvidia";
    steam.enable = lib.mkEnableOption "Enable unfree license for Steam";
    discord.enable = lib.mkEnableOption "Enable unfree license for Discord";
    reaper.enable = lib.mkEnableOption "Enable unfree license for Reaper";
  };

  config = {
    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) (
        (if cfg.nvidia.enable then predicates.nvidia else [ ])
        ++ (if cfg.steam.enable then predicates.steam else [ ])
        ++ (if cfg.discord.enable then predicates.discord else [ ])
        ++ (if cfg.reaper.enable then predicates.reaper else [ ])
      );
  };
}
