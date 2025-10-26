{ config, lib, pkgs, pkgs-unstable, ... }:

let
  cfg = config.modDev.lsp;
in
{
  options.modDev.lsp = {
    nixd.enable = lib.mkEnableOption "Enable nix LSP";
    clangd.enable = lib.mkEnableOption "Enable C/C++ LSP";
    zls.enable = lib.mkEnableOption "Enable Zig LSP";
    rust-analyzer.enable = lib.mkEnableOption "Enable Rust LSP";
    pyright.enable = lib.mkEnableOption "Enable Python LSP";
    lua-language-server.enable = lib.mkEnableOption "Enable Lua LSP";
  };

  config = {
    environment = {
      systemPackages = lib.concatLists [
        (if cfg.nixd.enable then [ pkgs.nixd ] else [])
        (if cfg.clangd.enable then [ pkgs.clang-tools ] else [])
        (if cfg.zls.enable then [ pkgs-unstable.zls ] else [])
        (if cfg.rust-analyzer.enable then [ pkgs.rust-analyzer ] else [])
        (if cfg.pyright.enable then [ pkgs.pyright ] else [])
        (if cfg.lua-language-server.enable then [ pkgs.lua-language-server ] else [])
      ];
    };
  };
}

