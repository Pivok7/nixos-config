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

  modHome.tui.kitty.enable = true;
  modHome.tui.nushell.enable = true;

  modHome.dev.bundle.favourite.enable = true;
  modHome.dev.bundle.web.enable = true;
  modHome.dev.bundle.slang.enable = true;

  modHome.media.nomacs.enable = true;
  modHome.media.vlc.enable = true;
  modHome.media.zathura.enable = true;

  modHome.tools.latex = {
    enable = true;
    lsp.enable = true;
  };

  modHome.tools.typst = {
    enable = true;
    lsp.enable = true;
  };

  modHome.browser.firefox = {
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
      ungoogled-chromium
      libreoffice
      keepassxc
      qbittorrent
      syncthing
      zed-editor

      # Creative
      inkscape
      gimp
      libresprite

      # Utils
      lazygit
      btop
      wget
      zip
      unzip
      openssl
      ffmpeg
      obs-studio
      glow
      ccrypt

      # Games
      prismlauncher

      # Fonts
      nerd-fonts.symbols-only
      iosevka-bin
    ])
    ++ (with pkgs-unstable; [
      tor-browser
      opencode
    ])
    ++ (with pkgs.nur-pivok; [
      makker
      uncom
      bandcamp-dl
    ]);

  home.stateVersion = "25.05";
}
