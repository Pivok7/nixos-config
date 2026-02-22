{
  lib,
  pkgs,
  pkgs-unstable,
  my-modules,
  ...
}:
{
  imports = [
    "${my-modules}/home"
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

  modHome.dots.hyprland.enable = true;
  modHome.dots.eww.enable = true;
  modHome.dots.wlogout.enable = true;
  modHome.dots.neovim = {
    enable = true;
    defaultEditor = true;
    clipboardWl.enable = true;
    ripgrep.enable = true;
  };
  modHome.dots.yazi = {
    enable = true;
    dragAndDrop.enable = true;
  };

  modHome.desktop.hypridle.enable = true;
  modHome.desktop.hyprlock = {
    enable = true;
    font = "Iosevka Etoile";
  };
  modHome.desktop.hyprpaper = {
    enable = true;
    wallpaper = "/home/pivok/Obrazy/wallpaper.png";
  };
  modHome.desktop.screenshot.grimSlurpSwappy.enable = true;
  modHome.desktop.launcher.wofi.enable = true;
  modHome.desktop.udiskie.enable = true;

  modHome.tui.kitty = {
    enable = true;
    font.size = 20.0;
  };
  modHome.tui.nushell = {
    enable = true;
    hyprsunset.enable = true;
  };

  modHome.dev.bundle.favourite.enable = true;
  modHome.dev.bundle.web.enable = true;
  modHome.dev.bundle.slang.enable = true;

  modHome.media.nomacs = {
    enable = true;
    defaultViewer = true;
  };
  modHome.media.mpv = {
    enable = true;
    defaultVideoPlayer = true;
    defaultAudioPlayer = true;
  };
  modHome.media.zathura = {
    enable = true;
    defaultPdfViewer = true;
  };

  modHome.tools.latex = {
    enable = true;
    lsp.enable = true;
  };

  modHome.tools.typst = {
    enable = true;
    lsp.enable = true;
  };

  modHome.browser.librewolf = {
    enable = true;
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
      lact
      libreoffice
      keepassxc
      qbittorrent
      syncthing

      # Creative
      gimp
      inkscape
      reaper
      libresprite

      # Tui
      lazygit
      btop

      # Utils
      wget
      dash
      killall
      zip
      unzip
      openssl
      ffmpeg
      obs-studio
      glow

      # Fonts
      nerd-fonts.symbols-only
      iosevka-bin
      (iosevka-bin.override { variant = "Aile"; })
      (iosevka-bin.override { variant = "Etoile"; })
      roboto
      roboto-serif
      roboto-slab

      # Gaming
      rpcs3
    ])
    ++ (with pkgs-unstable; [
      opencode
      kew
      tor-browser
    ])
    ++ (with pkgs.nur-pivok; [
      makker
      uncom
      bandcamp-dl
    ]);

  home.stateVersion = "25.05";
}
