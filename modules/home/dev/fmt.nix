{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.dev.fmt;
in
{
  options.modHome.dev.fmt = {
    nix.enable = lib.mkEnableOption "Enable Nix formatter";
    rust.enable = lib.mkEnableOption "Enable Rust formatter";
    python.enable = lib.mkEnableOption "Enable Python formatter";
    lua.enable = lib.mkEnableOption "Enable Lua formatter";
    web.enable = lib.mkEnableOption "Enable Typescript formatter";
    csharp.enable = lib.mkEnableOption "Enable C# formatter";
  };

  config = {
    home.packages = lib.concatLists [
      (if cfg.nix.enable then [ pkgs.nixfmt ] else [ ])
      (if cfg.rust.enable then [ pkgs.rustfmt ] else [ ])
      (if cfg.python.enable then [ pkgs.black ] else [ ])
      (if cfg.lua.enable then [ pkgs.stylua ] else [ ])
      (if cfg.web.enable then [ pkgs.nodePackages.prettier ] else [ ])
      (if cfg.csharp.enable then [ pkgs.csharpier ] else [ ])
    ];
  };
}
