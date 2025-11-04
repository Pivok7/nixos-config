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
    clipboardWl = lib.mkEnableOption "Enable system clipboard on wayland";
    ripgrep = lib.mkEnableOption "Enable greb searching";
  };

  config = lib.mkIf (cfg.enable) {
    programs.neovim = {
      enable = cfg.enable;
      defaultEditor = cfg.defaultEditor;
    };
    environment = {
      systemPackages = lib.concatLists [
        (if cfg.clipboardWl then [ pkgs.wl-clipboard ] else [ ])
        (if cfg.clipboardWl then [ pkgs.ripgrep ] else [ ])
      ];
    };
  };
}
