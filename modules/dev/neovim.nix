{ config, lib, pkgs, ... }:

let
  cfg = config.modDev.neovim;
in
{
  options.modDev.neovim = {
    enable = lib.mkEnableOption "Neovim text editor";
  };

  config = lib.mkIf (cfg.enable) {
    environment = {
    	systemPackages = [ pkgs.neovim ];
    };
  };
}
