{
  lib,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:
{
  imports = [
    "${inputs.my-modules}/home"
    inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
  ];

  # GTK
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

  # QT
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

  programs.hyprcursor-phinger.enable = true;

  modHome.dots.hyprland.enable = true;
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

  modHome.desktop.screenshot.grimSlurpSwappy.enable = true;
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
  modHome.dev.bundle.latex.enable = true;
  modHome.dev.bundle.typst.enable = true;

  modHome.media.nomacs = {
    enable = true;
    defaultViewer = true;
  };
  modHome.media.vlc = {
    enable = true;
    defaultVideoPlayer = true;
    defaultAudioPlayer = true;
  };
  modHome.media.zathura = {
    enable = true;
    defaultPdfViewer = true;
  };

  modHome.browser.firefox = {
    enable = true;
    addons = [
      "ublock"
      "clean-urls"
    ];
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
      # Gui
      blueman
      pwvucontrol
      easyeffects
      lact
      libreoffice
      keepassxc
      qbittorrent
      syncthing
      zed-editor

      # Creative
      gimp
      inkscape
      reaper
      libresprite

      # Tui
      lazygit
      btop

      # Utils
      hyprsunset
      playerctl
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
      prismlauncher
      rpcs3
    ])
    ++ (with pkgs-unstable; [
      opencode
      kew
      tor-browser
      noctalia-shell
    ])
    ++ (with pkgs.nur-pivok; [
      makker
      uncom
      bandcamp-dl
    ]);

  home.stateVersion = "25.05";
}
