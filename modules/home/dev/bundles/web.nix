{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHomeDev.bundle.web;
in
{
  options.modHomeDev.bundle.web = {
    enable = lib.mkEnableOption "Web development bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHomeDev.lsp = {
      typescript.enable = true;
      tailwind.enable = true;
      astro.enable = true;
    };
    modHomeDev.fmt.web.enable = true;
    home.packages = with pkgs; [
      live-server
      typescript
      tailwindcss_4
      nodejs
      bun
    ];
  };
}
