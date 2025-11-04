{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.stateVersion = "25.05";

  # GTK4 Setup
  dconf.settings."org/gnome/desktop/interface" = {
    gtk-theme = lib.mkForce "Adwaita";
    icon-theme = lib.mkForce "Papirus";
    color-scheme = "prefer-dark";
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "Adwaita";
    style = {
      name = "Adwaita";
      package = pkgs.adwaita-qt;
    };
  };

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
