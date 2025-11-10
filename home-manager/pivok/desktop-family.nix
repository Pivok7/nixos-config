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

  modHomeBrowser.firefox = {
    enable = true;
    bookmarks.enable = true;
    addons = [
      "ublock"
      "clean-urls"
      "dark-reader"
      "bandcamp-volume"
      "bandcamp-killer"
      "youtube-dislike"
      "youtube-unhook"
    ];
  };

  modHomeBrowser.librewolf = {
    enable = true;
    bookmarks.enable = true;
    addons = [
      "ublock"
      "clean-urls"
      "dark-reader"
      "bandcamp-volume"
      "bandcamp-killer"
      "youtube-dislike"
      "youtube-unhook"
    ];
  };

  modHomeBrowser.ladybird.enable = true;

  home.packages =
    (with pkgs; [
      # Gui
      ungoogled-chromium
      discord
      libreoffice
      keepassxc
      qbittorrent
      inkscape

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
