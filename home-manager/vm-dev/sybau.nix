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
        name = "Sybauinator3000";
        email = "krystiankap39@gmail.com";
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

  modHomeDev.bundle.web.enable = true;
  modHomeDev.bundle.rust.enable = true;

  modHomeMedia.nomacs.enable = true;
  modHomeMedia.vlc.enable = true;

  programs.firefox.enable = true;

  home.packages = (
    with pkgs;
    [
      # Tui
      lazygit
      btop

      # Utils
      wget
      zip
      unzip
      openssl
      gnumake
    ]
  ) ++ (with pkgs-unstable; [
      opencode
  ]);

  home.stateVersion = "25.05";
}
