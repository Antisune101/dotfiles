{ self, inputs, ... }: {
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nioxsSystem {
    modules = [ self.nixosModules.desktopConfig ];
  };
  
  flake.nixosModules.desktopConfig = { config, pkgs, ... }:

  {
    imports =
      [
        self.nixosModules.desktopHardware
        self.nixosModules.base
        self.nixosModules.general
        self.nixosModules.gaming
        self.nixosModules.desktop
        self.nixosModules.orca-slicer
        self.nixosModules.syncthing
      ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "nixos"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Africa/Johannesburg";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_ZA.UTF-8";

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "za";
      variant = "";
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "26.05"; # Did you read the comment?
  };
}
