{
  config,
  lib,
  ...
}:

let
  cfg = config.modUnfree.nvidia;
in
{
  options.modUnfree.nvidia = {
    enable = lib.mkEnableOption "Enable unfree predicate required by Nvidia";
  };

  config = lib.mkIf (cfg.enable) {
    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "nvidia-x11"
        "nvidia-settings"
        "nvidia-persistanced"
      ];
  };
}
