{
  config,
  lib,
  ...
}:

let
  cfg = config.modUnfree.steam;
in
{
  options.modUnfree.steam = {
    enable = lib.mkEnableOption "Enable unfree predicate required by Steam";
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
  };
}
