{
  inputs,
  home-manager,
  ...
}:
let
  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
  my-modules = inputs.my-modules;
in
{
  networking.hostName = "lenovo-i330";

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    ./hardware-configuration.nix
    ./key_remap.nix
    home-manager.nixosModules.home-manager
    "${my-modules}/system"
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit pkgs-unstable;
      inherit my-modules;
    };
    users.pivok = import ../../home-manager/pivok/laptop-lenovo-i330.nix;
  };

  # Bootloader.
  boot.loader.timeout = 2;
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 20;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  systemd.tpm2.enable = false;

  # Enable GPU
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "pl_PL.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Set display manager
  services.displayManager.ly = {
    enable = true;
    settings = {
      session_log = ".ly-session.log";
    };
  };

  # Desktop environments

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Gnome
  services.desktopManager.gnome.enable = true;
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  # Configure console keymap
  console.keyMap = "pl2";

  # Define a user account
  users.users.pivok = {
    isNormalUser = true;
    description = "Pivok";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # Enable essential services
  modSys.wine.enable = true;

  environment.systemPackages = with pkgs; [ nautilus ];

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
