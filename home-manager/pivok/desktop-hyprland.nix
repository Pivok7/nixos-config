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
    gtk-theme = lib.mkForce "Adwaita-dark";
    icon-theme = lib.mkForce "Papirus";
    cursor-theme = lib.mkForce "phinger-cursors-dark";
    font-name = lib.mkForce "Iosevka Etoile 11";
    color-scheme = lib.mkForce "prefer-dark";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Phinger";
      package = pkgs.phinger-cursors;
    };
    font = {
      name = "Iosevka Etoile";
      package = pkgs.iosevka-bin.override {
        variant = "Etoile";
      };
    };
  };

  qt = {
    enable = true;
    style = {
      name = "breeze";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Pivok";
        email = "pivoc@protonmail.com";
      };
      pull.rebase = false;
    };
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
  modHomeDesktop.hyprlock = {
    enable = true;
    font = "Iosevka Etoile";
  };
  modHomeDesktop.hyprpaper = {
    enable = true;
    wallpaper = "/home/pivok/Obrazy/wallpaper.png";
  };
  modHomeDesktop.screenshot.grimSlurpSwappy.enable = true;
  modHomeDesktop.launcher.wofi.enable = true;
  modHomeDesktop.udiskie.enable = true;

  modHomeTui.kitty = {
    enable = true;
    font.size = 20.0;
  };
  modHomeTui.nushell = {
    enable = true;
    hyprsunset.enable = true;
  };

  modHomeDev.bundle.favourite.enable = true;
  modHomeDev.bundle.web.enable = true;
  modHomeDev.bundle.slang.enable = true;

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
    bookmarks = {
      enable = true;
      path = ../../modules/home/browser/firefox/bookmarks-lianli.html;
    };
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
      nwg-look
      dconf-editor

      # Desktop
      rose-pine-hyprcursor
      hyprsunset
      wofi
      wlogout
      swaynotificationcenter

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
      reaper
      libresprite

      # Tui
      lazygit
      btop
      kew
      tmux

      # Utils
      wget
      dash
      killall
      zip
      unzip
      openssl
      ffmpeg
      obs-studio

      # Fonts
      nerd-fonts.symbols-only
      iosevka-bin
      (iosevka-bin.override { variant = "Aile"; })
      (iosevka-bin.override { variant = "Etoile"; })
      roboto
      roboto-serif
      roboto-slab

      # AI
      ollama-rocm

      # Gaming
      rpcs3
    ])
    ++ (with pkgs-unstable; [
      tor-browser
    ])
    ++ (with pkgs.nur-pivok; [
      makker
      uncom
      bandcamp-dl
    ]);

  home.stateVersion = "25.05";
}
