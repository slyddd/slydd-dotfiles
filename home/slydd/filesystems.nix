{ ... }:
{
  fileSystems."/mnt/serv2die" = {
    device = "slydd@192.168.10.3:/";
    fsType = "sshfs";
    options = [
      "nodev"
      "noatime"
      "allow_other"
      "IdentityFile=/slydd/.ssh/id_ed25519"
    ];
  };
}
