{...}:
{
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ];

    allowedTCPPorts = [ 22000 ];
    allowedUDPPorts = [ 21027 ];
  };

  services.tailscale = {
    enable = true;
    openFirewall = true;
    useRoutingFeatures = "both";
  };
}
