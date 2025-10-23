{ config, lib, pkgs, ... }:

let
  cfg = config.modMedia.nomacs;
in
{
  options.modMedia.nomacs = {
    enable = lib.mkEnableOption "Nomacs image viewer";
    defaultViewer = lib.mkEnableOption "Nomacs as default image viewer";
  };

  config = lib.mkIf (cfg.enable || cfg.defaultViewer) {
    assertions =
    [{
      assertion = !(cfg.defaultViewer && !cfg.enable);
      message = "programs.nomacs.defaultViewer will only work if programs.nomacs.enable is enable";
    }];
    environment = {
    	systemPackages = [ pkgs.nomacs ];
    };
  };
}
