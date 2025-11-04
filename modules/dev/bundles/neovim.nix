{
  config,
  lib,
  ...
}:

let
  cfg = config.modDev.bundle.neovim;
in
{
  options.modDev.bundle.neovim = {
    enable = lib.mkEnableOption "Neovim bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modDev.neovim = {
      enable = lib.mkDefault true;
      defaultEditor = lib.mkDefault true;
      clipboardWl = lib.mkDefault true;
    };
  };
}
