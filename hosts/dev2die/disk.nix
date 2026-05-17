{ ... }:
{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/6453e984-d511-4b8b-83b4-07e77cb4112b";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/6453e984-d511-4b8b-83b4-07e77cb4112b";
    fsType = "btrfs";
    options = [ "subvol=@home" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/6453e984-d511-4b8b-83b4-07e77cb4112b";
    fsType = "btrfs";
    options = [ "subvol=@nix" ];
  };

  fileSystems."/persist" = {
    device = "/dev/disk/by-uuid/6453e984-d511-4b8b-83b4-07e77cb4112b";
    fsType = "btrfs";
    options = [ "subvol=@persist" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/12CE-A600";
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
