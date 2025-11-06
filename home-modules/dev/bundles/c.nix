{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.homeModDev.bundle.c;
in
{
  options.homeModDev.bundle.c = {
    enable = lib.mkEnableOption "C/C++ bundle";
  };

  config = lib.mkIf (cfg.enable) {
    homeModDev.lsp.c.enable = true;
    home.packages = with pkgs; [
      gcc
      gnumake
      cmake
      meson
      ninja
    ];
  };
}
