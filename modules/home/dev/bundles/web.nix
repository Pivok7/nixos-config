{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.dev.bundle.web;
in
{
  options.modHome.dev.bundle.web = {
    enable = lib.mkEnableOption "Web development bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHome.dev.lsp = {
      typescript.enable = true;
      tailwind.enable = true;
      astro.enable = true;
    };
    modHome.dev.fmt.web.enable = true;
    home.packages = with pkgs; [
      live-server
      typescript
      tailwindcss_4
      nodejs
      bun
    ];
  };
}
