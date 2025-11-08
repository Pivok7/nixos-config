{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  home.stateVersion = "25.05";

  imports = [
    ../../home-modules/default.nix
  ];

  programs.git = {
    enable = true;
    userName = "Pivok";
    userEmail = "pivoc@protonmail.com";
  };

  homeModDots.neovim = {
    enable = true;
    defaultEditor.enable = true;
    clipboardWl.enable = true;
    ripgrep.enable = true;
  };
  homeModDots.yazi = {
    enable = true;
    dragAndDrop.enable = true;
  };

  homeModTui.kitty.enable = true;
  homeModTui.nushell.enable = true;

  homeModDev.bundle.favourite.enable = true;

  homeModTools.latex.enable = true;

  homeModMedia.firefox.enable = true;

  home.packages =
    (with pkgs; [
      # Gui
      ungoogled-chromium
      libreoffice
      keepassxc

      # Tui
      lazygit
      btop

      # Utils
      wget
      zip
      unzip

      # Media
      mpv
      nomacs

      # Games
      prismlauncher
    ])
    ++ (with pkgs-unstable; [
      tor-browser
    ]);
}
