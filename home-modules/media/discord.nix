{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.homeModMedia.discord;
in
{
  options.homeModMedia.discord = {
    enable = lib.mkEnableOption "Setup discord (unfree)";
  };

  config = lib.mkIf (cfg.enable) {
    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "discord"
      ];

    home.packages = [
      pkgs.discord
    ];
  };
}
