{
  inputs,
  pkgs,
  home-manager,
  ...
}:
let
  pkgs-25-05 = inputs.nixpkgs-25-05.legacyPackages.x86_64-linux;
  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
in
{
  networking.hostName = "vm-dev";

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
    extraSpecialArgs = {
      inherit pkgs-25-05;
      inherit pkgs-unstable;
    };
    users.sybau = import ../../home-manager/vm-dev/sybau.nix;
  };

  # Bootloader.
  boot.loader.timeout = 2;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  # Enable networking
  networking.networkmanager.enable = true;

  # Regional settings
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "pl_PL.UTF-8";
  services.xserver.xkb = {
    layout = "pl";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  #Disable DrKonqi
  systemd.services.drkonqi-coredump-processor = {
    enable = false;
  };

  # Configure console keymap
  console.keyMap = "pl2";

  # Enable sound with pipewire.
  modSys.pipewire.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sybau = {
    isNormalUser = true;
    description = "Sybau";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # Docker
  virtualisation.docker.enable = true;

  fonts.packages = with pkgs; [
    iosevka-bin
  ];

  environment.systemPackages = [ ];

  services.openssh.enable = true;

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
