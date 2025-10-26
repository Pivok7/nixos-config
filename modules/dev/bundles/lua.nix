{
  config,
  lib,
  ...
}:

let
  cfg = config.modDev.bundle.lua;
in
{
  options.modDev.bundle.lua = {
    enable = lib.mkEnableOption "Lua bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modDev.lsp.lua.enable = true;
    modDev.fmt.lua.enable = true;
  };
}
