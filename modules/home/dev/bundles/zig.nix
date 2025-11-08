{
  config,
  lib,
  pkgs-unstable,
  ...
}:

let
  cfg = config.modHomeDev.bundle.zig;
in
{
  options.modHomeDev.bundle.zig = {
    enable = lib.mkEnableOption "Zig bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHomeDev.lsp.zig.enable = true;
    home.packages = with pkgs-unstable; [
      zig
    ];
  };
}
