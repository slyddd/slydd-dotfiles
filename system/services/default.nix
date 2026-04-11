{ ... }:
{
  imports = [
    ./audio.nix
    ./network.nix
    ./sddm.nix
    ./xserver.nix
    ./logind.nix
    ./udisk.nix
    ./docker.nix
    ./bluetooth.nix
    ./sunshine.nix
  ];
}
