{
  config,
  lib,
  ...
}:

let
  cfg = config.modUnfree;
  nvidia = import ./nvidia.nix { };
  steam = import ./steam.nix { };
  discord = import ./discord.nix { };
  reaper = import ./reaper.nix { };
in
{
  options.modUnfree = {
    nvidia.enable = lib.mkEnableOption "Enable unfree license for Nvidia";
    steam.enable = lib.mkEnableOption "Enable unfree license for Steam";
    discord.enable = lib.mkEnableOption "Enable unfree license for Discord";
    reaper.enable = lib.mkEnableOption "Enable unfree license for Reaper";
  };

  config = {
    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) (
        (if cfg.nvidia.enable then nvidia.predicates else [ ])
        ++ (if cfg.steam.enable then steam.predicates else [ ])
        ++ (if cfg.discord.enable then discord.predicates else [ ])
        ++ (if cfg.reaper.enable then reaper.predicates else [ ])
      );
  };
}
