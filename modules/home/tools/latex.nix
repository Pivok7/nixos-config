{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.tools.latex;

  tex = pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-small
      collection-langeuropean
      collection-langgreek
      collection-langother
      collection-langpolish
      collection-langcyrillic
      biblatex
      biber
      ;
  };
in
{
  options.modHome.tools.latex = {
    enable = lib.mkEnableOption "LaTeX essentials";
    lsp.enable = lib.mkEnableOption "Enable LaTeX LSP";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = lib.concatLists [
      [ tex ]
      (
        if cfg.lsp.enable then
          [
            pkgs.texlab
            pkgs.tree-sitter
            pkgs.nodejs
          ]
        else
          [ ]
      )
    ];
  };
}
