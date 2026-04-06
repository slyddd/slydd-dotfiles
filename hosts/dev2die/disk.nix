{ ... }:
{
  boot.initrd.luks.devices."nixos".device = "/dev/disk/by-uuid/556b5dea-b11e-471e-a01d-03dc98dd9d29";

  fileSystems."/" = {
    device = "/dev/mapper/nixos";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };

  fileSystems."/nix" = {
    device = "/dev/mapper/nixos";
    fsType = "btrfs";
    options = [ "subvol=@nix" ];
  };

  fileSystems."/home" = {
    device = "/dev/mapper/nixos";
    fsType = "btrfs";
    options = [ "subvol=@home" ];
  };

  fileSystems."/persist" = {
    device = "/dev/mapper/nixos";
    fsType = "btrfs";
    options = [ "subvol=@persist" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/B15B-36C6";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  fileSystems."/home/serv2die" = {
    device = "slydd@192.168.10.3:/home/slydd";
    fsType = "sshfs";
    options = [
      "nodev"
      "noatime"
      "allow_other"
      "_netdev"
      "reconnect"
      "ServerAliveInterval=15"
      "IdentityFile=/root/.ssh/id_ed25519"
    ];
  };

  fileSystems."/home/minecraft" = {
    device = "sbhfhk5p.6fa1d023@urdusin.ultraservers.com:/";
    fsType = "sshfs";
    options = [
      "_netdev"
      "x-systemd.automount"
      "nofail"
      "reconnect"
      "ServerAliveInterval=15"
      "Port=60002"
      "IdentityFile=/root/.ssh/id_ed25519"
      "UserKnownHostsFile=/root/.ssh/known_hosts"
      "StrictHostKeyChecking=accept-new"
      "allow_other"
      "default_permissions"

      "workaround=fstat"

      "uid=1000"
      "gid=100"
      "umask=0022"
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
