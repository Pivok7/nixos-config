{
  config,
  lib,
  ...
}:

let
  cfg = config.modHome.dev.bundle.lua;
in
{
  options.modHome.dev.bundle.lua = {
    enable = lib.mkEnableOption "Lua bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHome.dev.lsp.lua.enable = true;
    modHome.dev.fmt.lua.enable = true;
  };
}
