{ pkgs, lib, ... }:
{
  boot.loader = {
    systemd-boot.enable = lib.mkForce true;
    timeout = 0;
    efi.canTouchEfiVariables = true;
  };

  environment.systemPackages = [
    pkgs.sbctl
  ];

  boot.lanzaboote = {
    enable = false;
    pkiBundle = "/var/lib/sbctl";
  };
}
