{
  config,
  lib,
  ...
}:

let
  cfg = config.modDev.bundle.nix;
in
{
  imports = [
    ../lsp.nix
    ../fmt.nix
  ];

  options.modDev.bundle.nix = {
    enable = lib.mkEnableOption "Nix bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modDev.lsp.nix.enable = true;
    modDev.fmt.nix.enable = true;
  };
}
