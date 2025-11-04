{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modDev.versioning;
in
{
  options.modDev.versioning = {
    git.enable = lib.mkEnableOption "Enable git";
    lazygit.enable = lib.mkEnableOption "Enable lazygit";
  };

  config = {
    environment = {
      systemPackages = lib.concatLists [
        (if cfg.git.enable then [ pkgs.git ] else [ ])
        (if cfg.lazygit.enable then [ pkgs.lazygit ] else [ ])
      ];
    };
  };
}
