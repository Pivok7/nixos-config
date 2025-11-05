{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.homeModDots.nvim;
in
{
  options.homeModDots.nvim = {
    enable = lib.mkEnableOption "Setup nvim";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.neovim
    ];

    home.file = {
      ".config/nvim" = {
        source = ./nvim;
      };
    };
  };
}
