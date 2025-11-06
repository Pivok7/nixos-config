{
  config,
  lib,
  pkgs-unstable,
  ...
}:

let
  cfg = config.homeModDev.bundle.zig;
in
{
  options.homeModDev.bundle.zig = {
    enable = lib.mkEnableOption "Zig bundle";
  };

  config = lib.mkIf (cfg.enable) {
    homeModDev.lsp.zig.enable = true;
    home.packages = with pkgs-unstable; [
      zig
    ];
  };
}
