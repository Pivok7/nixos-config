{
  config,
  pkgs,
  home-manager,
  ...
}:

{
  networking.hostName = "lianli";

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    ./hardware-configuration.nix
    ../../modules/root.nix
    home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.pivok = import ../../home-manager/pivok/desktop-hyprland.nix;
  };

  # Bootloader.
  boot.loader.timeout = 3;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 20;
    windows = {
      "11-home" = {
        title = "Windows 11";
        efiDeviceHandle = "FS1";
        sortKey = "z_windows";
      };
    };
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Set display manager and auto login
  services.displayManager.ly = {
    enable = true;
  };

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Regional settings
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "pl_PL.UTF-8";

  #User Pivok
  users.users.pivok = {
    isNormalUser = true;
    description = "Pivok";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  modDesktop.hyprland.enable = true;

  modSys.pipewire.enable = true;

  modMedia.nomacs.enable = true;

  modDev.bundle.favourite.enable = true;

  modTools.latex.enable = true;
  modTools.tor.enable = true;
  modTools.qbittorrent.enable = true;

  virtualisation.docker.enable = true;

  programs.git.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    iosevka-bin
  ];

  environment.systemPackages = with pkgs; [
    floorp
    wofi
    lazygit
    wlogout
    eww
    socat
    hyprpaper
    hyprlock
    hypridle
    hyprsunset
    flameshot
    swaynotificationcenter
    udiskie
    networkmanagerapplet
    dash
    keepassxc
  ];

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
