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
    extraConfig = {
      pull.rebase = false;
    };
  };

  modHomeDots.neovim = {
    enable = true;
    defaultEditor = true;
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
  modHomeDev.bundle.web.enable = true;

  modHomeMedia.nomacs.enable = true;
  modHomeMedia.vlc.enable = true;
  modHomeMedia.zathura.enable = true;

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

  home.packages =
    (with pkgs; [
      # Gui
      ungoogled-chromium
      discord
      libreoffice
      keepassxc
      qbittorrent

      # Creative
      inkscape
      gimp

      # Tui
      lazygit
      btop
      tmux

      # Utils
      wget
      zip
      unzip
      openssl

      # Games
      prismlauncher

      # Fonts
      iosevka-bin
    ])
    ++ (with pkgs-unstable; [
      tor-browser
    ]);
}
