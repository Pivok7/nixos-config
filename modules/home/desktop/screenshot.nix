{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHomeDesktop.screenshot;
in
{
  options.modHomeDesktop.screenshot = {
    grimSlurpSwappy.enable = lib.mkEnableOption "Enable grim, slurp and swappy screenshot pack";
  };

  config = {
    home.packages = lib.concatLists [
      (
        if cfg.grimSlurpSwappy.enable then
          [
            pkgs.grim
            pkgs.slurp
            pkgs.swappy
          ]
        else
          [ ]
      )
    ];
  };
}
