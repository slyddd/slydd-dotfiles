{ ... }:
{
  boot.loader = {
    systemd-boot.enable = true;
    timeout = 0;
    efi.canTouchEfiVariables = false;
  };
}
