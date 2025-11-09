{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  home.stateVersion = "25.05";

  imports = [
    ../../modules/home/default.nix
  ];

  programs.git = {
    enable = true;
    userName = "Pivok";
    userEmail = "pivoc@protonmail.com";
  };

  modHomeDots.neovim = {
    enable = true;
    defaultEditor.enable = true;
    clipboardWl.enable = true;
    ripgrep.enable = true;
  };
  modHomeDots.yazi = {
    enable = true;
    dragAndDrop.enable = true;
  };

  modHomeTui.kitty.enable = true;
  modHomeTui.nushell.enable = true;

  modHomeDev.bundle.favourite.enable = true;

  modHomeTools.latex.enable = true;

  modHomeMedia.firefox = {
    enable = true;
    bookmarks.enable = true;
    addons = [
      "ublock"
      "dark-reader"
      "bandcamp-volume"
      "bandcamp-killer"
      "youtube-dislike"
      "youtube-unhook"
    ];
  };

  modHomeMedia.librewolf = {
    enable = true;
    bookmarks.enable = true;
    addons = [
      "ublock"
      "dark-reader"
      "bandcamp-volume"
      "bandcamp-killer"
      "youtube-dislike"
      "youtube-unhook"
    ];
  };

  home.packages =
    (with pkgs; [
      # Gui
      ungoogled-chromium
      discord
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
