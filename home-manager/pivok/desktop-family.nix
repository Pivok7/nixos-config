{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  imports = [
    ../../modules/home/default.nix
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
      libresprite

      # Tui
      lazygit
      btop
      kew

      # Utils
      wget
      zip
      unzip
      openssl
      ffmpeg
      obs-studio

      # Games
      prismlauncher

      # Fonts
      nerd-fonts.symbols-only
      iosevka-bin

      # AI
      opencode
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
