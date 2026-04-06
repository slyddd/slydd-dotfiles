{ ... }:
{
  programs.dank-material-shell.settings = {
    # ── Status Bar Icons ──────────────────────────────────────────────────
    controlCenterShowNetworkIcon = true;
    controlCenterShowBluetoothIcon = true;
    controlCenterShowAudioIcon = true;
    controlCenterShowAudioPercent = false;
    controlCenterShowVpnIcon = true;
    controlCenterShowBrightnessIcon = false;
    controlCenterShowBrightnessPercent = false;
    controlCenterShowMicIcon = false;
    controlCenterShowMicPercent = false;
    controlCenterShowBatteryIcon = false;
    controlCenterShowPrinterIcon = false;
    controlCenterShowScreenSharingIcon = true;

    # ── Widget List ───────────────────────────────────────────────────────
    #
    controlCenterWidgets = [
      {
        id = "volumeSlider";
        enabled = true;
        width = 50;
      }
      {
        id = "brightnessSlider";
        enabled = true;
        width = 50;
      }
      {
        id = "wifi";
        enabled = true;
        width = 50;
      }
      {
        id = "bluetooth";
        enabled = true;
        width = 50;
      }
      {
        id = "audioOutput";
        enabled = true;
        width = 50;
      }
      {
        id = "audioInput";
        enabled = true;
        width = 50;
      }
    ];
  };
}
