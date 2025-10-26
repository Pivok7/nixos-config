{ config, lib, pkgs, ... }:

let
  cfg = config.modTools.latex;
  
  tex = pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-small
      babel-polish
  ;};
in
{
  options.modTools.latex = {
    enable = lib.mkEnableOption "LaTeX essentials";
  };

  config = lib.mkIf (cfg.enable) {
    environment.systemPackages = [
      tex
    ];
  };
}

