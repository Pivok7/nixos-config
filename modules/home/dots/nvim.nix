{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.modHome.dots.neovim;
in
{
  options.modHome.dots.neovim = {
    enable = lib.mkEnableOption "Setup Neovim";
    defaultEditor = lib.mkEnableOption "Make Neovim the default editor";
    clipboardWl.enable = lib.mkEnableOption "Enable system clipboard on wayland";
    ripgrep.enable = lib.mkEnableOption "Enable greb searching";
  };

  config = lib.mkIf (cfg.enable) {
    programs.neovim = {
      enable = cfg.enable;
      defaultEditor = cfg.defaultEditor;
    };

    home.packages = lib.concatLists [
      [ pkgs.gcc ]
      (if cfg.clipboardWl.enable then [ pkgs.wl-clipboard ] else [ ])
      (if cfg.ripgrep.enable then [ pkgs.ripgrep ] else [ ])
    ];

    home.file.".config/nvim" = {
      source = ./nvim;
    };
  };
}
