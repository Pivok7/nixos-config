{
  config,
  lib,
  ...
}:

let
  cfg = config.modHome.dev.bundle.nix;
in
{
  options.modHome.dev.bundle.nix = {
    enable = lib.mkEnableOption "Nix bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHome.dev.lsp.nix.enable = true;
    modHome.dev.fmt.nix.enable = true;
  };
}
