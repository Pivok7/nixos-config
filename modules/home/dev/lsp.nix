{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}:

let
  cfg = config.modHome.dev.lsp;
in
{
  options.modHome.dev.lsp = {
    nix.enable = lib.mkEnableOption "Enable nix LSP";
    c.enable = lib.mkEnableOption "Enable C/C++ LSP";
    zig.enable = lib.mkEnableOption "Enable Zig LSP";
    rust.enable = lib.mkEnableOption "Enable Rust LSP";
    python.enable = lib.mkEnableOption "Enable Python LSP";
    lua.enable = lib.mkEnableOption "Enable Lua LSP";
    typescript.enable = lib.mkEnableOption "Enable Typescript LSP";
    tailwind.enable = lib.mkEnableOption "Enable Tailwind LSP";
    svelte.enable = lib.mkEnableOption "Enable Svelte LSP";
    csharp.enable = lib.mkEnableOption "Enable C# LSP";
    latex.enable = lib.mkEnableOption "Enable LaTeX LSP";
    typst.enable = lib.mkEnableOption "Enable Typst LSP";
  };

  config = {
    home.packages = lib.concatLists [
      (if cfg.nix.enable then [ pkgs.nixd ] else [ ])
      (if cfg.c.enable then [ pkgs.clang-tools ] else [ ])
      (if cfg.zig.enable then [ pkgs-unstable.zls ] else [ ])
      (if cfg.rust.enable then [ pkgs.rust-analyzer ] else [ ])
      (if cfg.python.enable then [ pkgs.ty ] else [ ])
      (if cfg.lua.enable then [ pkgs.lua-language-server ] else [ ])
      (if cfg.typescript.enable then [ pkgs.typescript-language-server ] else [ ])
      (if cfg.tailwind.enable then [ pkgs.tailwindcss-language-server ] else [ ])
      (if cfg.svelte.enable then [ pkgs.svelte-language-server ] else [ ])
      (if cfg.csharp.enable then [ pkgs.omnisharp-roslyn ] else [ ])
      (
        if cfg.latex.enable then
          with pkgs;
          [
            texlab
            tree-sitter
            nodejs
          ]
        else
          [ ]
      )
      (if cfg.typst.enable then [ pkgs.tinymist ] else [ ])
    ];
  };
}
