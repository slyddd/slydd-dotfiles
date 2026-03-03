{inputs, ...}:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms-plugin-registry.modules.default
  ];

  programs.dank-material-shell = {
    enable = true;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };

    enableDynamicTheming = true;
    enableClipboardPaste = true;

    plugins = {
      dankBatteryAlerts.enable = true;
      dockerManager.enable = true;
    };
  };
}
