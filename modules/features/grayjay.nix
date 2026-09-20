{ ... }: {
  flake.nixosModules.grayjay = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      grayjay
    ];
    
  };
}
