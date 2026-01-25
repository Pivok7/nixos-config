{
  config,
  lib,
  ...
}:

let
  cfg = config.modHomeDev.bundle.favourite;
in
{
  options.modHomeDev.bundle.favourite = {
    enable = lib.mkEnableOption "My favourite dev bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHomeDev.bundle = {
      nix.enable = lib.mkDefault true;
      c.enable = lib.mkDefault true;
      zig.enable = lib.mkDefault true;
      rust.enable = lib.mkDefault true;
      python.enable = lib.mkDefault true;
      lua.enable = lib.mkDefault true;
    };
  };
}
