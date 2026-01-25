{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.dev.bundle.c;
in
{
  options.modHome.dev.bundle.c = {
    enable = lib.mkEnableOption "C/C++ bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHome.dev.lsp.c.enable = true;
    home.packages = with pkgs; [
      gcc
      gnumake
      cmake
      meson
      ninja
    ];
  };
}
