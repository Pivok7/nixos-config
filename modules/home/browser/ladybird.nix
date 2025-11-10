{
  config,
  lib,
  pkgs-unstable,
  ...
}:

let
  cfg = config.modHomeBrowser.ladybird;
in
{
  options.modHomeBrowser.ladybird = {
    enable = lib.mkEnableOption "Setup ladybird";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs-unstable; [
      ladybird
    ];
  };
}
