{...}:
{
  programs.dank-material-shell = {
    settings.barConfigs = [
      {
        id = "default";
        name = "Main Bar";
        enabled = true;
        position = 0;
        screenPreferences = [
          "all"
        ];
        showOnLastDisplay = true;
        leftWidgets = [
          {
            id = "separator";
            enabled = false;
          }
          {
            id = "launcherButton";
            enabled = true;
          }
          {
            id = "focusedWindow";
            enabled = true;
          }
        ];
        centerWidgets = [
          {
            id = "workspaceSwitcher";
            enabled = true;
          }
        ];
        rightWidgets = [
          {
            id = "privacyIndicator";
            enabled = true;
          }
          {
            id = "clock";
            enabled = true;
          }
          {
            id = "dmsLenovoBatterySettings";
            enabled = true;
          }
          {
            id = "separator";
            enabled = false;
          }
          {
            id = "hyprlandSubmap";
            enabled = true;
          }
        ];
        spacing = 0;
        innerPadding = 0;
        bottomGap = 4;
        transparency = 1;
        widgetTransparency = 1;
        squareCorners = true;
        noBackground = true;
        gothCornersEnabled = true;
        gothCornerRadiusOverride = false;
        gothCornerRadiusValue = 18;
        borderEnabled = false;
        borderColor = "surfaceText";
        borderOpacity = 1;
        borderThickness = 1;
        fontScale = 1;
        autoHide = false;
        autoHideDelay = 250;
        openOnOverview = false;
        visible = true;
        popupGapsAuto = true;
        popupGapsManual = 4;
        widgetPadding = 7;
        maximizeWidgetIcons = false;
        maximizeWidgetText = false;
        removeWidgetPadding = false;
      }
    ];
  };
}
