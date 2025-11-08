{
  config,
  lib,
  ...
}:

let
  cfg = config.modHomeDev.bundle.lua;
in
{
  options.modHomeDev.bundle.lua = {
    enable = lib.mkEnableOption "Lua bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHomeDev.lsp.lua.enable = true;
    modHomeDev.fmt.lua.enable = true;
  };
}
