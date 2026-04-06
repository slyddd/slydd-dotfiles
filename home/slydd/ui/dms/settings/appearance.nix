{ config, ... }:
{
  programs.dank-material-shell.settings = {
    # ── Theme ─────────────────────────────────────────────────────────────
    currentThemeName = "dynamic";
    currentThemeCategory = "dynamic";
    customThemeFile = "";
    registryThemeVariants = { };

    # ── Matugen ───────────────────────────────────────────────────────────
    matugenScheme = config.theme.schemeType;
    runUserMatugenTemplates = true;
    matugenTargetMonitor = "";

    # ── Transparency ──────────────────────────────────────────────────────
    popupTransparency = 1;

    # ── Colors ────────────────────────────────────────────────────────────
    widgetBackgroundColor = "sch";
    widgetColorMode = "default";
    controlCenterTileColorMode = "primary";
    buttonColorMode = "primary";

    # ── Corner Radius ─────────────────────────────────────────────────────
    cornerRadius = 7;

    # ── Night Mode ────────────────────────────────────────────────────────
    nightModeEnabled = true;
    nightModeTemperature = 4200;
    nightModeHighTemperature = 6500;
    nightModeAutoEnabled = true;
    nightModeAutoMode = "location";
    nightModeStartHour = 18;
    nightModeStartMinute = 0;
    nightModeEndHour = 6;
    nightModeEndMinute = 0;
    latitude = 0;
    longitude = 0;
    nightModeUseIPLocation = true;
    nightModeLocationProvider = "";

    # ── Material 3 Elevation ──────────────────────────────────────────────
    m3ElevationEnabled = true;
    m3ElevationIntensity = 12;
    m3ElevationOpacity = 30;
    m3ElevationColorMode = "default";
    m3ElevationLightDirection = "top";
    m3ElevationCustomColor = "#000000";
    modalElevationEnabled = true;
    popoutElevationEnabled = true;
    barElevationEnabled = false;

    # ── Wallpaper ─────────────────────────────────────────────────────────
    wallpaperFillMode = "Fill";
    blurredWallpaperLayer = true;
    blurWallpaperOnOverview = true;

    # ── Hyprland ──────────────────────────────────────────────────────────────
    hyprlandLayoutGapsOverride = 10;
    hyprlandLayoutRadiusOverride = 14;
    hyprlandLayoutBorderSize = 2;
  };
}
