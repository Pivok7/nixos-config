{ config, pkgs, ... }:
{
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "Pivok";
    userEmail = "pivoc@protonmail.com";
  };
}
