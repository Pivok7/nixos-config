{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.dev.bundle.rust;
in
{
  options.modHome.dev.bundle.rust = {
    enable = lib.mkEnableOption "Rust bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHome.dev.lsp.rust.enable = true;
    modHome.dev.fmt.rust.enable = true;
    home.packages = with pkgs; [
      rustc
      cargo
      clippy
    ];
  };
}
