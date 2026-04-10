{ ... }:
{
  #boot.initrd.luks.devices."nixos".device = "/dev/disk/by-uuid/556b5dea-b11e-471e-a01d-03dc98dd9d29";

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/d82c91dc-2fcf-4d18-8d13-2d3cb8051b0a";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/d82c91dc-2fcf-4d18-8d13-2d3cb8051b0a";
    fsType = "btrfs";
    options = [ "subvol=@nix" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/d82c91dc-2fcf-4d18-8d13-2d3cb8051b0a";
    fsType = "btrfs";
    options = [ "subvol=@home" ];
  };

  fileSystems."/persist" = {
    device = "/dev/disk/by-uuid/d82c91dc-2fcf-4d18-8d13-2d3cb8051b0a";
    fsType = "btrfs";
    options = [ "subvol=@persist" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3D47-0847";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  swapDevices = [ ];

  zramSwap = {
    enable = true;
    priority = 100;
    algorithm = "lz4";
    memoryPercent = 50;
  };

  services.fstrim.enable = true;
}
