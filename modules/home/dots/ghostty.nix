{
  lib,
  config,
  pkgs-unstable,
  ...
}:

let
  cfg = config.modHome.dots.ghostty;
in
{
  options.modHome.dots.ghostty = {
    enable = lib.mkEnableOption "Setup ghostty";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs-unstable.ghostty
    ];

    home.file.".config/ghostty" = {
      source = ./ghostty;
    };
  };
}
