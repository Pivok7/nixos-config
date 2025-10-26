{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modDev.bundle.python;
in
{
  imports = [
    ../lsp.nix
    ../fmt.nix
  ];

  options.modDev.bundle.python = {
    enable = lib.mkEnableOption "Python bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modDev.lsp.python.enable = true;
    modDev.fmt.python.enable = true;
    environment = {
      systemPackages = with pkgs; [
        python3
      ];
    };
  };
}
