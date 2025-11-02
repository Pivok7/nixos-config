{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  home-manager,
  ...
}:

{
  networking.hostName = "home-pc";

  imports = [
    ./hardware-configuration.nix
    ../../modules/root.nix
    home-manager.nixosModules.home-manager
  ];

    #home-manager = {
    #  useGlobalPkgs = true;
    #  useUserPackages = true;
    #  users.pivok = import ../../home-manager/pivok/desktop-kde.nix;
    #};

  # Bootloader.
  boot.loader.timeout = 2;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;
  # Keep only x last generations
  boot.loader.grub.configurationLimit = 20;

  fileSystems."/mnt/SSD_120GB" = {
    device = "/dev/sda3";
    fsType = "ext4";
  };

  fileSystems."/mnt/HDD_500GB" = {
    device = "/dev/sdb1";
    fsType = "ext4";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "nvidia-persistanced"
      "discord"
      "steam"
      "steam-unwrapped"
    ];

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Regional settings
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "pl_PL.UTF-8";
  services.xserver.xkb = {
    layout = "pl";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pivok = {
    isNormalUser = true;
    description = "Pivok";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "pivok";

  programs.firefox.enable = true;

  modSys.pipewire.enable = true;
  modSys.printer.enable = true;

  modMedia.nomacs.enable = true;

  modDev.bundle.favourite.enable = true;
  modDev.bundle.web.enable = true;

  modTools.latex.enable = true;
  modTools.tor.enable = true;
  modTools.qbittorrent.enable = true;

  virtualisation.docker.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  fonts.packages = with pkgs; [
    iosevka-bin
  ];

  # Packages installed in system profile
  environment.systemPackages =
    (with pkgs; [
      floorp
      keepassxc
      mpv
      git
      lazygit
      btop
      wineWowPackages.stable
      wget
      handlr-regex
      wl-clipboard
      zip
      unzip
      libreoffice

      discord
      prismlauncher
    ])

    ++

      (with pkgs-unstable; [
        zig
      ]);

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "25.05"; # Nixos version
}
