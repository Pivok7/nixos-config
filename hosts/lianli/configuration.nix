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
    ../../modules/default.nix
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

  # Set display manager and auto login
  services.displayManager.ly = {
    enable = true;
  };

  modDesktop.hyprland.enable = true;
  modDesktop.eww.enable = true;

  modSys.pipewire = {
	enable = true;
	gui.enable = true;
    };
  modSys.bluetooth = {
    enable = true;
    gui.enable = true;
  };

  modGaming.steam.enable = true;
  modGaming.rpcs3.enable = true;

  modMedia.nomacs.enable = true;
  modMedia.discord.enable = true;

  modDev.bundle.favourite.enable = true;

  modTools.latex.enable = true;
  modTools.tor.enable = true;
  modTools.qbittorrent.enable = true;

  virtualisation.docker.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  programs.hyprlock.enable = true;
  security.pam.services.hyprlock = {
    enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    iosevka-bin
  ];

  environment.systemPackages = with pkgs; [
    floorp
    wofi
    wlogout
    hyprpaper
    hypridle
    hyprsunset
    flameshot
    swaynotificationcenter
    udiskie
    networkmanagerapplet
    dash
    keepassxc
    lact
    kew
    p7zip
    dconf-editor
  ];

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
