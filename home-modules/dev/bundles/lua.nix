{
  config,
  lib,
  ...
}:

let
  cfg = config.homeModDev.bundle.lua;
in
{
  options.homeModDev.bundle.lua = {
    enable = lib.mkEnableOption "Lua bundle";
  };

  config = lib.mkIf (cfg.enable) {
    homeModDev.lsp.lua.enable = true;
    homeModDev.fmt.lua.enable = true;
  };
}
