{ pkgs, ... }:
{
  # Shell configuration
  programs.zsh.enable = true;
  environment.shells = [ pkgs.zsh ];
  users.defaultUserShell = pkgs.zsh;

  users.users.slydd = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "input"
      "network"
      "networkmanager"
      "git"
      "docker"
    ];
    shell = pkgs.zsh;
  };
}
