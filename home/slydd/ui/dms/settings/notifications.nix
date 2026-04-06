{ ... }:
{
  programs.dank-material-shell.settings = {
    # ── Popup ─────────────────────────────────────────────────────────────
    notificationOverlayEnabled = false;
    notificationPopupShadowEnabled = true;
    notificationPopupPrivacyMode = true;
    notificationPopupPosition = 3;
    modalDarkenBackground = true;

    # ── Timeouts (ms, 0 = never) ──────────────────────────────────────────
    notificationTimeoutLow = 5000;
    notificationTimeoutNormal = 5000;
    notificationTimeoutCritical = 0;

    # ── Appearance ────────────────────────────────────────────────────────
    notificationCompactMode = true;

    # ── Animation ─────────────────────────────────────────────────────────
    notificationAnimationSpeed = 1;
    notificationCustomAnimationDuration = 400;

    # ── History ───────────────────────────────────────────────────────────
    notificationHistoryEnabled = true;
    notificationHistoryMaxCount = 50;
    notificationHistoryMaxAgeDays = 7;
    notificationHistorySaveLow = true;
    notificationHistorySaveNormal = true;
    notificationHistorySaveCritical = true;

    # ── Rules ─────────────────────────────────────────────────────────────
    notificationRules = [ ];
  };
}
