{ inputs, modulesPath, ... }:
{
  networking.hostName = "DEV2DIE";

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./disk.nix
    ./kernel.nix
    ./users.nix
  ];

  system.stateVersion = "25.11";
}
