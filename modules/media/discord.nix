{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modMedia.discord;
in
{
  options.modMedia.discord = {
    enable = lib.mkEnableOption "Enable Discord messanger (unfree)";
  };

  config = lib.mkIf (cfg.enable) {
    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "discord"
      ];
    environment.systemPackages = [
      pkgs.discord
    ];
  };
}
