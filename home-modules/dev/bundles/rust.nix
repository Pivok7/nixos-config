{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.homeModDev.bundle.rust;
in
{
  options.homeModDev.bundle.rust = {
    enable = lib.mkEnableOption "Rust bundle";
  };

  config = lib.mkIf (cfg.enable) {
    homeModDev.lsp.rust.enable = true;
    homeModDev.fmt.rust.enable = true;
    home.packages = with pkgs; [
      rustc
      cargo
    ];
  };
}
