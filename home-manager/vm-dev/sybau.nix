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
    defaultEditor.enable = true;
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

  programs.firefox.enable = true;

  home.packages =
    (with pkgs; [
      # Tui
      lazygit
      btop
      tmux

      # Utils
      wget
      zip
      unzip
      openssl

      # Media
      mpv
      nomacs
    ]);
}
