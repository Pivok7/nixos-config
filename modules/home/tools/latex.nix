{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHomeTools.latex;

  tex = pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-small
      babel-polish
      ;
  };
in
{
  options.modHomeTools.latex = {
    enable = lib.mkEnableOption "LaTeX essentials";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      tex
    ];
  };
}
