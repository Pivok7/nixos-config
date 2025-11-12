{
  pkgs,
  ...
}:
{
  home.stateVersion = "25.05";

  imports = [
    ../../modules/home/default.nix
  ];

  programs.git = {
    enable = true;
    userName = "Sybauinator3000";
    userEmail = "krystiankap39@gmail.com";
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

  modHomeDev.bundle.web.enable = true;
  modHomeDev.bundle.rust.enable = true;

  modHomeMedia.nomacs = {
    enable = true;
    defaultViewer = true;
  };
  modHomeMedia.vlc = {
    enable = true;
    defaultVideoPlayer = true;
    defaultAudioPlayer = true;
  };

  programs.firefox.enable = true;

  home.packages = (
    with pkgs;
    [
      # Tui
      lazygit
      btop
      tmux

      # Utils
      wget
      zip
      unzip
      openssl
    ]
  );
}
