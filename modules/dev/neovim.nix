{ config, lib, pkgs, ... }:

let
  cfg = config.modDev.neovim;
in
{
  options.modMedia.nomacs = {
    enable = lib.mkEnableOption "Neovim text editor";
    lsp-clangd = lib.mkEnableOption "Download clangd LSP";
    lsp-zls = lib.mkEnableOption "Download pyright LSP";
    lsp-rust-analyzer = lib.mkEnableOption "Download rust-analyzer LSP";
    lsp-lua-lsp = lib.mkEnableOption "Download lus-lsp LSP";
    lsp-pyright = lib.mkEnableOption "Download pyright LSP";
  };

  config = lib.mkIf (cfg.enable) {
    environment = {
    	systemPackages = [ pkgs.neovim ];
    };
  };

  config = lib.mkIf (cfg.enable || cfg.lsp-clangd) {
    assertions =
    [{
      assertion = (!cfg.enable && cfg.lsp-clangd);
      message = "lsp-clangd will only work if modDev.neovim.enable is enable";
    }];
    environment = {
    	systemPackages = [ pkgs.clang-tools.clangd ];
    };
  };
}
