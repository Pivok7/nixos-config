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
        name = "Sybauinator3000";
        email = "krystiankap39@gmail.com";
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

  modHome.dev.bundle.web.enable = true;
  modHome.dev.bundle.rust.enable = true;

  modHome.media.nomacs.enable = true;
  modHome.media.vlc.enable = true;

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
