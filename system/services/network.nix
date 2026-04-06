{ ... }:
{
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = false;
    trustedInterfaces = [ "tailscale0" ];

    allowedTCPPorts = [
      22000 # Syncthing
    ];
    allowedUDPPorts = [
      21027 # Syncthing
    ];

    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      } # KDE Connect
    ];
    allowedUDPPortRanges = [
      {
        from = 1714;
        to = 1764;
      } # KDE Connect
    ];
  };

  services.tailscale = {
    enable = true;
    openFirewall = true;
    useRoutingFeatures = "both";
  };
}
