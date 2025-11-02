{ config, pkgs, ... }:
{
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "Pivok";
    userEmail = "pivoc@protonmail.com";
  };

  xdg.configFile = {
    "nushell/config.nu" = {
      source = ../../dots/nushell/config.nu;
    };
  };
}
