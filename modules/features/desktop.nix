{ self, ... }: {
  flake.nixosModules.desktop = { ... }: {
    imports = [
      self.nixosModules.cosmic
      self.nixosModules.kanata
      self.nixosModules.firefox
      self.nixosModules.kitty
      self.nixosModules.grayjay
    ];
  };
}
