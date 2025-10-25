{ config, lib, pkgs, pkgs-unstable, ... }:

let
  cfg = config.modDev.lsp;
in
{
  options.modDev.lsp = {
    clangd.enable = lib.mkEnableOption "clangd LSP";
    zls.enable = lib.mkEnableOption "pyright LSP";
    rust-analyzer.enable = lib.mkEnableOption "rust-analyzer LSP";
  };

  config = {
    environment = {
      systemPackages = lib.concatLists [
        (if cfg.clangd.enable then [ pkgs.clang-tools ] else [])
        (if cfg.zls.enable then [ pkgs-unstable.zls ] else [])
        (if cfg.rust-analyzer.enable then [ pkgs.rust-analyzer ] else [])
      ];
    };
  };
}
