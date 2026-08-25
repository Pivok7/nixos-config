{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:
{
  imports = [
    "${inputs.my-modules}/home"
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

  modHome.term.ghostty.enable = true;
  modHome.term.nushell.enable = true;

  modHome.dev.bundle.favourite.enable = true;
  modHome.dev.bundle.web.enable = true;
  modHome.dev.bundle.slang.enable = true;
  modHome.dev.bundle.latex.enable = true;
  modHome.dev.bundle.typst.enable = true;
  modHome.dev.bundle.rocq.enable = true;

  modHome.media.nomacs.enable = true;
  modHome.media.vlc.enable = true;
  modHome.media.zathura.enable = true;

  modHome.browser.firefox = {
    enable = true;
    addons = [
      "ublock"
      "privacy-badger"
      "youtube-dislike"
    ];
  };

  modHome.browser.librewolf = {
    enable = true;
    addons = [
      "ublock"
      "privacy-badger"
      "dark-reader"
      "bandcamp-volume"
      "bandcamp-killer"
      "youtube-dislike"
      "youtube-unhook"
    ];
  };

  home.packages =
    (with pkgs; [
      ungoogled-chromium
      libreoffice
      keepassxc
      qbittorrent
      syncthing
      zed-editor
      kdePackages.skanlite
      telegram-desktop

      # Creative
      inkscape
      blender
      gimp
      libresprite
      logseq

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
      radicle-tui
      radicle-desktop

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

  home.stateVersion = "26.05";
}
