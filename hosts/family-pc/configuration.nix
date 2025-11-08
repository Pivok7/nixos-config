{
  config,
  pkgs,
  pkgs-unstable,
  home-manager,
  ...
}:

{
  networking.hostName = "family-pc";

  imports = [
    ./hardware-configuration.nix
    ../../modules/default.nix
    home-manager.nixosModules.home-manager
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  modUnfree.nvidia.enable = true;
  modUnfree.steam.enable = true;
  modUnfree.discord.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit pkgs-unstable; };
    users.pivok = import ../../home-manager/pivok/desktop-family.nix;
  };

  # Bootloader.
  boot.loader.timeout = 2;
  boot.loader.grub = {
    enable = true;
    device = "/dev/nvme0n1";
    useOSProber = true;
    configurationLimit = 20;
  };

  fileSystems."/mnt/SSD_120GB" = {
    device = "/dev/sda3";
    fsType = "ext4";
  };

  fileSystems."/mnt/HDD_500GB" = {
    device = "/dev/sdb1";
    fsType = "ext4";
  };

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

  # Enable essential services
  modSys.pipewire.enable = true;
  modSys.printer.enable = true;
  modSys.steam.enable = true;

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "pivok";

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
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "25.05"; # Nixos version
}
