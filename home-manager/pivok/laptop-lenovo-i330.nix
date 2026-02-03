{
  pkgs,
  pkgs-unstable,
  my-modules,
  ...
}:
{
  imports = [
    "${my-modules}/home"
  ];

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
    font.size = 17.0;
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
      # Gui
      discord
      libreoffice
      keepassxc
      qbittorrent
      syncthing

      # Creative
      gimp
      inkscape
      libresprite

      # Tui
      lazygit
      btop

      # Utils
      wget
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
    ])
    ++ (with pkgs-unstable; [
      opencode
      tor-browser
    ])
    ++ (with pkgs.nur-pivok; [
      makker
      uncom
    ]);

  home.stateVersion = "25.11";
}
