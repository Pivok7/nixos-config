{
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

  modHome.desktop.hypridle.enable = true;
  modHome.desktop.hyprlock = {
    enable = true;
    font = "Iosevka Etoile";
  };
  modHome.desktop.screenshot.grimSlurpSwappy.enable = true;
  modHome.desktop.udiskie.enable = true;

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

  modHome.tui.kitty = {
    enable = true;
    font.size = 18.0;
  };
  modHome.tui.nushell = {
    enable = true;
    hyprsunset.enable = true;
  };

  modHome.dev.bundle.favourite.enable = true;
  modHome.dev.bundle.web.enable = true;
  modHome.dev.bundle.slang.enable = true;
  modHome.dev.bundle.csharp.enable = true;
  modHome.dev.bundle.latex.enable = true;
  modHome.dev.bundle.typst.enable = true;

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
      libreoffice
      keepassxc
      qbittorrent
      syncthing
      pwvucontrol

      # Creative
      gimp
      inkscape
      libresprite

      # Tui
      foot
      lazygit
      btop
      zellij

      # Utils
      distrobox
      wget
      killall
      zip
      unzip
      openssl
      ffmpeg
      obs-studio
      glow
      brightnessctl
      hyprsunset

      # Fonts
      nerd-fonts.symbols-only
      iosevka-bin
      (iosevka-bin.override { variant = "Aile"; })
      (iosevka-bin.override { variant = "Etoile"; })
    ])
    ++ (with pkgs-unstable; [
      opencode
      tor-browser
      noctalia-shell
    ])
    ++ (with pkgs.nur-pivok; [
      makker
      uncom
    ]);

  home.stateVersion = "26.05";
}
