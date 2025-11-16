{
  lib,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  imports = [
    ../../modules/home/default.nix
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

  programs.git = {
    enable = true;
    userName = "Pivok";
    userEmail = "pivoc@protonmail.com";
  };

  modHomeDots.hyprland.enable = true;
  modHomeDots.eww.enable = true;
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

  modHomeDesktop.hypridle.enable = true;
  modHomeDesktop.hyprlock.enable = true;
  modHomeDesktop.hyprpaper = {
    enable = true;
    wallpaper = "/home/pivok/Obrazy/wallpaper.png";
  };
  modHomeDesktop.screenshot.grimSlurpSwappy.enable = true;

  modHomeTui.kitty.enable = true;
  modHomeTui.nushell = {
    enable = true;
    hyprsunset.enable = true;
  };

  modHomeDev.bundle.favourite.enable = true;
  modHomeDev.bundle.web.enable = true;

  modHomeMedia.nomacs = {
    enable = true;
    defaultViewer = true;
  };
  modHomeMedia.mpv = {
    enable = true;
    defaultVideoPlayer = true;
    defaultAudioPlayer = true;
  };
  modHomeMedia.zathura = {
    enable = true;
    defaultPdfViewer = true;
  };

  modHomeTools.latex = {
    enable = true;
    lsp.enable = true;
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

  modHomeGaming.rpcs3.enable = true;

  home.packages =
    (with pkgs; [
      # Desktop
      rose-pine-hyprcursor
      hyprsunset
      wofi
      wlogout
      swaynotificationcenter
      udiskie

      # Gui
      blueman
      pwvucontrol
      lact
      discord
      libreoffice
      keepassxc
      qbittorrent

      # Creative
      gimp
      inkscape
      ardour

      # Tui
      lazygit
      btop
      kew
      tmux

      # Utils
      wget
      dash
      zip
      unzip
      openssl

      # Fonts
      nerd-fonts.symbols-only
      iosevka-bin
      roboto
      roboto-serif
      roboto-slab

      # Nur Pivok
      nur-pivok.makker
      nur-pivok.uncom
    ])
    ++ (with pkgs-unstable; [
      tor-browser
    ]);

  home.stateVersion = "25.05";
}
