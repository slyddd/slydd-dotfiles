{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/12f7771b-881f-489f-b1eb-73aa40532e30";
      fsType = "btrfs";
      options = [ "compress=zstd" "subvol=root" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/12f7771b-881f-489f-b1eb-73aa40532e30";
      fsType = "btrfs";
      options = [ "compress=zstd" "subvol=home" ];
    };

  fileSystems."/games" =
    { device = "/dev/disk/by-uuid/12f7771b-881f-489f-b1eb-73aa40532e30";
      fsType = "btrfs";
      options = [ "compress=zstd" "subvol=games" ];
    };

  fileSystems."/swap" =
    { device = "/dev/disk/by-uuid/12f7771b-881f-489f-b1eb-73aa40532e30";
      fsType = "btrfs";
      options = [ "noatime" "subvol=swap" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/12f7771b-881f-489f-b1eb-73aa40532e30";
      fsType = "btrfs";
      options = [ "compress=zstd" "noatime" "subvol=nix" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/5600-C9B6";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [{ device = "/swap/swapfile"; }];
}
