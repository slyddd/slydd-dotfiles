{ pkgs, lib, ... }:
{
  boot.loader = {
    systemd-boot.enable = lib.mkForce false;
    timeout = 0;
    efi.canTouchEfiVariables = false;
  };

  environment.systemPackages = [
    pkgs.sbctl
  ];

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
}
