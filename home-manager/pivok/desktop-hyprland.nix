{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.stateVersion = "25.05";

  imports = [
    ../../home-modules/default.nix
  ];

  # GTK4 Setup
  dconf.settings."org/gnome/desktop/interface" = {
    gtk-theme = lib.mkForce "Adwaita";
    icon-theme = lib.mkForce "Papirus";
    cursor-theme = lib.mkForce "phinger-cursors-dark";
    color-scheme = "prefer-dark";
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Phinger";
      package = pkgs.phinger-cursors;
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

  home.packages = [
    pkgs.rose-pine-hyprcursor
    pkgs.hyprsunset
  ];

  programs.git = {
    enable = true;
    userName = "Pivok";
    userEmail = "pivoc@protonmail.com";
  };

  homeModDots.hyprland.enable = true;
  homeModDots.eww.enable = true;
  homeModDots.nvim.enable = true;
  homeModDots.yazi.enable = true;

  homeModDesktop.hypridle.enable = true;
  homeModDesktop.hyprlock.enable = true;
  homeModDesktop.hyprpaper = {
    enable = true;
    wallpaper = "/home/pivok/Obrazy/wallpaper.png";
  };
  homeModDesktop.screenshot.grimSlurpSwappy.enable = true;

  homeModGui.firefox.enable = true;

  homeModTui.kitty.enable = true;

  homeModTui.nushell = {
    enable = true;
    hyprsunset.enable = true;
  };
}
