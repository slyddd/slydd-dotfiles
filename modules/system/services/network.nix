{
  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [ 8081 ];
  networking.firewall.allowedUDPPorts = [ ];
  networking.firewall.enable = true;
}
