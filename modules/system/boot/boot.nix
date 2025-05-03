{ config, lib, pkgs, modulesPath, ... }:

let
  esp = "/boot";
in
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod"];
    initrd.kernelModules = [ ];
    initrd.systemd.enable = true;

    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];

    loader.systemd-boot = {
      enable = true;
      extraEntries = {
        "grub.conf" = "
          title GRUB
          efi /EFI/nixos/grubx64.efi
          sort-key z_grub
        ";
      };
    };

    loader.efi.canTouchEfiVariables = true;
    loader.efi.efiSysMountPoint = esp;
    loader.timeout = 0;

    uki.settings = {
      microcode = "${pkgs.microcode-intel}/intel-ucode.img";
    };

    # Activate Plymouth
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };

    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;

    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
  };

  networking.useDHCP = lib.mkDefault true;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
