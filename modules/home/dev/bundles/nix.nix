{
  config,
  lib,
  ...
}:

let
  cfg = config.modHomeDev.bundle.nix;
in
{
  options.modHomeDev.bundle.nix = {
    enable = lib.mkEnableOption "Nix bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHomeDev.lsp.nix.enable = true;
    modHomeDev.fmt.nix.enable = true;
  };
}
