{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modDev.neovim;
in
{
  options.modDev.neovim = {
    enable = lib.mkEnableOption "Enable Neovim text editor";
    defaultEditor = lib.mkEnableOption "Make Neovim the default editor";
  };

  config = lib.mkIf (cfg.enable) {
      programs.neovim = {
        enable = cfg.enable;
        defaultEditor = cfg.defaultEditor;
      };
  };
}
