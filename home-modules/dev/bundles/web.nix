{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.homeModDev.bundle.web;
in
{
  options.homeModDev.bundle.web = {
    enable = lib.mkEnableOption "Web development bundle";
  };

  config = lib.mkIf (cfg.enable) {
    homeModDev.lsp.typescript.enable = true;
    homeModDev.fmt.web.enable = true;
    home.packages = with pkgs; [
      live-server
      typescript
    ];
  };
}
