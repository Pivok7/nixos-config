{
  inputs,
  config,
  home-manager,
  ...
}:
let
  pkgs-25-05 = inputs.nixpkgs-25-05.legacyPackages.x86_64-linux;
  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
  nix-flatpak = inputs.nix-flatpak;
in
{
  networking.hostName = "family-pc";

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    ./hardware-configuration.nix
    ../../modules/default.nix
    home-manager.nixosModules.home-manager
    "${nix-flatpak}/modules/nixos.nix"
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit pkgs-25-05;
      inherit pkgs-unstable;
    };
    users.pivok = import ../../home-manager/pivok/desktop-family.nix;
  };

  # Allow unfree packages
  modUnfree.nvidia.enable = true;
  modUnfree.steam.enable = true;
  modUnfree.discord.enable = true;

  # Bootloader
  boot.loader.timeout = 2;
  boot.loader.grub = {
    enable = true;
    device = "/dev/nvme0n1";
    useOSProber = true;
    configurationLimit = 20;
  };

  fileSystems."/mnt/SSD_120GB" = {
    device = "/dev/disk/by-uuid/c8e4f54d-1163-4dbb-b439-2c62a720be0b";
    fsType = "ext4";
    options = [
      "nofail" # Prevent system from failing if this drive doesn't mount
    ];
  };

  fileSystems."/mnt/HDD_500GB" = {
    device = "/dev/disk/by-uuid/9cbcc89c-1a13-4f3b-b6a1-6d54c09a68ea";
    fsType = "ext4";
    options = [
      "nofail" # Prevent system from failing if this drive doesn't mount
    ];
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
  # For GPU pass-through
  hardware.nvidia-container-toolkit.enable = true;

  # Enable GPU graphics
  hardware.graphics = {
    enable = true;
  };

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
  modSys.wine.enable = true;
  modSys.steam.enable = true;

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "pivok";

  virtualisation.docker.enable = true;

  # Flatpak
  services.flatpak.update.onActivation = true;
  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
    ];
  };

  # Packages installed in system profile
  environment.systemPackages = [ ];

  system.stateVersion = "25.05"; # Nixos version
}
