{ config, lib, pkgs, pkgs-unstable, ... }:

let
  cfg = config.modDev.lsp;
in
{
  options.modDev.lsp = {
    nix.enable = lib.mkEnableOption "Enable nix LSP";
    c.enable = lib.mkEnableOption "Enable C/C++ LSP";
    zig.enable = lib.mkEnableOption "Enable Zig LSP";
    rust.enable = lib.mkEnableOption "Enable Rust LSP";
    python.enable = lib.mkEnableOption "Enable Python LSP";
    lua.enable = lib.mkEnableOption "Enable Lua LSP";
  };

  config = {
    environment = {
      systemPackages = lib.concatLists [
        (if cfg.nix.enable then [ pkgs.nixd ] else [])
        (if cfg.c.enable then [ pkgs.clang-tools ] else [])
        (if cfg.zig.enable then [ pkgs-unstable.zls ] else [])
        (if cfg.rust.enable then [ pkgs.rust-analyzer ] else [])
        (if cfg.python.enable then [ pkgs.pyright ] else [])
        (if cfg.lua.enable then [ pkgs.lua-language-server ] else [])
      ];
    };
  };
}

