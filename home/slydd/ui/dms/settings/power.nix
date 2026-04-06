{ ... }:
{
  programs.dank-material-shell.settings = {
    loginctlLockIntegration = false;

    # ── AC Power ──────────────────────────────────────────────────────────
    acMonitorTimeout = 0;
    acLockTimeout = 0;
    acSuspendTimeout = 0;
    acSuspendBehavior = 0;
    acProfileName = "";

    # ── Battery ───────────────────────────────────────────────────────────
    batteryMonitorTimeout = 0;
    batteryLockTimeout = 0;
    batterySuspendTimeout = 0;
    batterySuspendBehavior = 0;
    batteryProfileName = "";
    batteryChargeLimit = 100;

    # ── Power Menu ────────────────────────────────────────────────────────
    powerActionConfirm = true;
    powerActionHoldDuration = 0.5;
    powerMenuDefaultAction = "logout";
    powerMenuGridLayout = false;
    powerMenuActions = [
      "reboot"
      "logout"
      "poweroff"
      "lock"
      "suspend"
      "restart"
    ];

    # ── Custom Power Actions ───────────────────────────────────────────────
    customPowerActionLock = "hyprlock";
    customPowerActionLogout = "";
    customPowerActionSuspend = "systemctl suspend";
    customPowerActionHibernate = "";
    customPowerActionReboot = "";
    customPowerActionPowerOff = "";

    # ── Launch Prefix ─────────────────────────────────────────────────────
    launchPrefix = "";
  };
}
