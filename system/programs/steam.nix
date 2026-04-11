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
    steamos.useSteamOSConfig = true;

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
    ENABLE_GAMESCOPE_WSI = "1";
    STEAM_MULTIPLE_XWAYLANDS = "1";
  };
}
