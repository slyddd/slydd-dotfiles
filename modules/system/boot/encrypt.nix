{
  boot.initrd.luks.devices."root" = {
    device = "/dev/disk/by-uuid/87096f79-8679-4906-a525-663a4b6fbe0c";
    allowDiscards = true;
    keyFileSize = 4096;
    keyFile = "/dev/sdb";
    keyFileTimeout = 10;
  };
}
