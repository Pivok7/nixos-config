{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHomeDev.bundle.c;
in
{
  options.modHomeDev.bundle.c = {
    enable = lib.mkEnableOption "C/C++ bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHomeDev.lsp.c.enable = true;
    home.packages = with pkgs; [
      gcc
      gnumake
      cmake
      meson
      ninja
    ];
  };
}
