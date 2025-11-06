{
  config,
  lib,
  ...
}:

let
  cfg = config.homeModDev.bundle.nix;
in
{
  options.homeModDev.bundle.nix = {
    enable = lib.mkEnableOption "Nix bundle";
  };

  config = lib.mkIf (cfg.enable) {
    homeModDev.lsp.nix.enable = true;
    homeModDev.fmt.nix.enable = true;
  };
}
