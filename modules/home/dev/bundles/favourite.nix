{
  config,
  lib,
  ...
}:

let
  cfg = config.modHome.dev.bundle.favourite;
in
{
  options.modHome.dev.bundle.favourite = {
    enable = lib.mkEnableOption "My favourite dev bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHome.dev.bundle = {
      nix.enable = lib.mkDefault true;
      c.enable = lib.mkDefault true;
      zig.enable = lib.mkDefault true;
      rust.enable = lib.mkDefault true;
      python.enable = lib.mkDefault true;
      lua.enable = lib.mkDefault true;
    };
  };
}
