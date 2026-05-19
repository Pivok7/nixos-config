{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.dev.bundle.latex;

  tex = pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-small
      collection-langpolish
      latexindent
      biblatex
      biber
      ;
  };
in
{
  options.modHome.dev.bundle.latex = {
    enable = lib.mkEnableOption "LaTeX bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHome.dev.lsp.latex.enable = true;
    home.packages = [ tex ];
  };
}
