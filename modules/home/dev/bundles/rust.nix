{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHomeDev.bundle.rust;
in
{
  options.modHomeDev.bundle.rust = {
    enable = lib.mkEnableOption "Rust bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHomeDev.lsp.rust.enable = true;
    modHomeDev.fmt.rust.enable = true;
    home.packages = with pkgs; [
      rustc
      cargo
    ];
  };
}
