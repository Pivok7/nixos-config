{
  config,
  lib,
  pkgs-unstable,
  ...
}:

let
  cfg = config.modHome.dev.bundle.zig;
in
{
  options.modHome.dev.bundle.zig = {
    enable = lib.mkEnableOption "Zig bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHome.dev.lsp.zig.enable = true;
    home.packages = with pkgs-unstable; [
      zig
    ];
  };
}
