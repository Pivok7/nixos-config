{
  config,
  lib,
  ...
}:

let
  cfg = config.modUnfree.discord;
in
{
  options.modUnfree.discord = {
    enable = lib.mkEnableOption "Enable unfree predicate required by Discord";
  };

  config = lib.mkIf (cfg.enable) {
    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "discord"
      ];
  };
}
