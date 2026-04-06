{...}:
{
  programs.dank-material-shell = {
    settings.barConfigs = [
      {
        id = "bar1772555947721";
        name = "Bar 2";
        enabled = true;
        position = 1;
        screenPreferences = [
          "all"
        ];
        showOnLastDisplay = false;
        leftWidgets = [
          {
            id = "weather";
            enabled = true;
          }
          {
            id = "dankPomodoroTimer";
            enabled = true;
          }
          {
            id = "music";
            enabled = true;
          }
        ];
        centerWidgets = [
          {
            id = "runningApps";
            enabled = true;
            runningAppsCompactMode = true;
            runningAppsGroupByApp = false;
            runningAppsCurrentWorkspace = true;
            runningAppsCurrentMonitor = false;
          }
        ];
        rightWidgets = [
          {
            id = "systemTray";
            enabled = true;
          }
          {
            id = "tailscale";
            enabled = true;
          }
          {
            id = "dankKDEConnect";
            enabled = true;
          }
          {
            id = "battery";
            enabled = true;
          }
          {
            id = "controlCenterButton";
            enabled = true;
            showNetworkIcon = true;
            showBluetoothIcon = true;
            showAudioIcon = true;
            showAudioPercent = false;
            showVpnIcon = true;
            showBrightnessIcon = false;
            showBrightnessPercent = false;
            showMicIcon = false;
            showMicPercent = false;
            showBatteryIcon = false;
            showPrinterIcon = false;
            showScreenSharingIcon = true;
          }
        ];
        spacing = 3;
        innerPadding = 3;
        bottomGap = 0;
        transparency = 0;
        widgetTransparency = 1;
        squareCorners = true;
        noBackground = false;
        gothCornersEnabled = false;
        gothCornerRadiusOverride = false;
        gothCornerRadiusValue = 18;
        borderEnabled = false;
        borderColor = "surfaceText";
        borderOpacity = 1;
        borderThickness = 1;
        widgetOutlineEnabled = false;
        widgetOutlineColor = "primary";
        widgetOutlineOpacity = 1;
        widgetOutlineThickness = 1;
        widgetPadding = 7;
        maximizeWidgetIcons = false;
        maximizeWidgetText = false;
        removeWidgetPadding = false;
        fontScale = 1;
        iconScale = 1;
        autoHide = false;
        autoHideDelay = 250;
        showOnWindowsOpen = false;
        openOnOverview = false;
        visible = true;
        popupGapsAuto = true;
        popupGapsManual = 4;
        maximizeDetection = true;
        scrollEnabled = true;
        scrollXBehavior = "column";
        scrollYBehavior = "workspace";
        shadowIntensity = 0;
        shadowOpacity = 60;
        shadowDirectionMode = "inherit";
        shadowDirection = "top";
        shadowColorMode = "default";
        shadowCustomColor = "#000000";
      }
    ];
  };
}
