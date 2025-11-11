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
