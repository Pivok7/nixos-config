{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.homeModTools.latex;

  tex = pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-small
      babel-polish
      ;
  };
in
{
  options.homeModTools.latex = {
    enable = lib.mkEnableOption "LaTeX essentials";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      tex
    ];
  };
}
