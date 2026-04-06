{...}:
{
  programs.dank-material-shell.settings = {
    # ── Bar Buttons ───────────────────────────────────────────────────────
    showLauncherButton       = true;
    showWorkspaceSwitcher    = true;
    showFocusedWindow        = true;
    showWeather              = true;
    showMusic                = true;
    showClipboard            = true;
    showCpuUsage             = true;
    showMemUsage             = true;
    showCpuTemp              = true;
    showGpuTemp              = true;
    showSystemTray           = true;
    showClock                = true;
    showNotificationButton   = true;
    showBattery              = true;
    showControlCenterButton  = true;
    showCapsLockIndicator    = true;

    # ── GPU ───────────────────────────────────────────────────────────────
    selectedGpuIndex  = 0;
    enabledGpuPciIds  = [];

    # ── Privacy Button ────────────────────────────────────────────────────
    showPrivacyButton          = true;
    privacyShowMicIcon         = false;
    privacyShowCameraIcon      = false;
    privacyShowScreenShareIcon = false;

    # ── Audio / Media ─────────────────────────────────────────────────────
    waveProgressEnabled   = true;
    scrollTitleEnabled    = true;
    audioVisualizerEnabled = true;
    audioScrollMode       = "volume";
    audioWheelScrollAmount = 5;
    mediaSize             = 1;

    # ── Running Apps ──────────────────────────────────────────────────────
    runningAppsCompactMode      = true;
    runningAppsCurrentWorkspace = true;
    runningAppsGroupByApp       = false;
    runningAppsCurrentMonitor   = false;

    # ── Bar App Limits ────────────────────────────────────────────────────
    barMaxVisibleApps        = 0;
    barMaxVisibleRunningApps = 0;
    barShowOverflowBadge     = true;

    # ── Apps Dock (bar) ───────────────────────────────────────────────────
    appsDockHideIndicators     = false;
    appsDockColorizeActive     = false;
    appsDockActiveColorMode    = "primary";
    appsDockEnlargeOnHover     = false;
    appsDockEnlargePercentage  = 125;
    appsDockIconSizePercentage = 100;

    # ── Misc Widgets ──────────────────────────────────────────────────────
    focusedWindowCompactMode       = false;
    keyboardLayoutNameCompactMode  = false;
    centeringMode                  = "index";
  };
}
