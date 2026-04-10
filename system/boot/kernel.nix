{
  pkgs,
  lib,
  ...
}:

{
  # Microcode AMD
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;

  # ZEN KERNEL (default)
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # STOCK KERNEL
  specialisation.stock.configuration = {
    boot.kernelPackages = lib.mkForce pkgs.linuxPackages;
  };

  boot.tmp.cleanOnBoot = true;
  boot.initrd.systemd.enable = true;
  boot.initrd.systemd.emergencyAccess = true;

  # Plymouth
  boot.plymouth = {
    enable = true;
    theme = "deus_ex";
    themePackages = with pkgs; [
      (adi1090x-plymouth-themes.override {
        selected_themes = [ "deus_ex" ];
      })
    ];
  };

  # Silent boot
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

  boot.kernelParams = [
    "quiet"
    "splash"
    "mem_sleep_default=deep"
  ];

}
