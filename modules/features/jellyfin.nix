{ inputs, config, ... }: {
  flake.nixosModules.jellyfin = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      jellyfin
      jellyfin-web
      jellyfin-ffmpeg
    ];
    services.jellyfin = {
      enable = true;
      openFirewall = true;
      user = "ebester";
    };
  };
}
