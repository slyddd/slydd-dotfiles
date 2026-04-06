{ ... }:
{
  programs.dank-material-shell = {
    plugins = {
      # Notifs
      dankBatteryAlerts.enable = true;

      # Bars
      dankKDEConnect.enable = true;
      dankPomodoroTimer.enable = true;
      dmsLenovoBatterySettings.enable = true;
      hyprlandSubmap.enable = true;
      tailscale.enable = true;
      homeAssistantMonitor.enable = true;

      # Search
      dankGifSearch.enable = true;
      emojiLauncher.enable = true;
      webSearch.enable = true;
      dankObsidian.enable = true;
      sshConnections.enable = true;
    };
  };
}
