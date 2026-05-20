{
  pkgs,
  inputs,
  home-manager,
  ...
}:
let
  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
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
    "${inputs.my-modules}/system"
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit pkgs-unstable;
      inherit inputs;
    };
    users.pivok = import ../../home-manager/pivok/laptop-lenovo-i330.nix;
  };

  # Bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    timeout = 2;
    systemd-boot = {
      enable = true;
      configurationLimit = 20;
    };
  };
  # Boot splash screen
  boot.plymouth = {
    enable = true;
    theme = "hexagon_2";
    themePackages = with pkgs; [
      # By default we would install all themes
      (adi1090x-plymouth-themes.override {
        selected_themes = [ "hexagon_2" ];
      })
    ];
  };
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
      animation = "colormix";
      bigclock = "en";
    };
  };

  # Desktop environments

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Configure console keymap
  console.keyMap = "pl2";

  # Define a user account
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
  modSys.wine.enable = true;
  modSys.pipewire.enable = true;
  modSys.bluetooth.enable = true;

  virtualisation.docker = {
    enable = true;
    rootless.enable = true;
  };

  environment.systemPackages = [ ];

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
