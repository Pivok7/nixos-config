{ config, pkgs, ... }:
{
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "Pivok";
    userEmail = "pivoc@protonmail.com";
  };

  home.file.".config/nushell/config.nu".text = ''
    $env.config.show_banner = false
    $env.config.edit_mode = 'vi'
    $env.EDITOR = 'nvim'

    alias hsct = hyprctl hyprsunset temperature
  '';
}
