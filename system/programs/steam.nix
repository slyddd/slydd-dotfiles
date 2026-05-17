{
  pkgs,
  ...
}:
{
  programs.steam = {
    enable = true;
    extest.enable = true;
    gamescopeSession.enable = false;
  };

  jovian = {
    hardware.has.amd.gpu = true;

    steam = {
      enable = true;
      user = "slydd";
    };

    decky-loader = {
      enable = true;
      user = "slydd";
      stateDir = "/home/slydd/decky-loader";
      extraPackages = with pkgs; [
        python3
        systemd
        gamescope
      ];
    };
  };

  environment.sessionVariables = {
    PROTON_USE_NTSYNC = "1";
    ENABLE_HDR_WSI = "0";
    DXVK_HDR = "0";
    PROTON_ENABLE_AMD_AGS = "1";
    PROTON_ENABLE_NVAPI = "1";
  };

  system.activationScripts.decky-cef.text = ''
    install -Dm644 /dev/null /home/slydd/.steam/steam/.cef-enable-remote-debugging
    chown slydd:users /home/slydd/.steam/steam/.cef-enable-remote-debugging
  '';
}
