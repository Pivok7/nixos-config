{
  inputs,
  home-manager,
  ...
}:
let
  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
  my-modules = inputs.my-modules;
in
{
  networking.hostName = "lianli";

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    ./hardware-configuration.nix
    "${my-modules}/system"
    home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit pkgs-unstable;
      inherit my-modules;
    };
    users.pivok = import ../../home-manager/pivok/desktop-hyprland.nix;
  };

  # Allow unfree packages
  modSys.unfreePred = {
    steam.enable = true;
    discord.enable = true;
    reaper.enable = true;
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

  fileSystems."/mnt/Windows" = {
    device = "/dev/disk/by-uuid/10866BEE866BD2B0";
    fsType = "ntfs";
    options = [
      "nofail" # Prevent system from failing if this drive doesn't mount
    ];
  };

  # Enable GPU graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Desktops
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
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

  # Set display manager
  services.displayManager.ly = {
    enable = true;
    settings = {
      session_log = ".ly-session.log";
      animation = "doom";
      bigclock = "en";
      min_refresh_delta = "20";
    };
  };

  # Enable essential services
  modSys.pipewire = {
    enable = true;
    jack.enable = true;
  };
  modSys.bluetooth.enable = true;
  modSys.wine.enable = true;
  modSys.steam.enable = true;
  modSys.udisks2.enable = true;

  virtualisation.docker.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = [ ];

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
