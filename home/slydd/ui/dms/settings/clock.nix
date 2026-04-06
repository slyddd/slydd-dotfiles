{...}:
{
  programs.dank-material-shell.settings = {
    # ── Time Format ───────────────────────────────────────────────────────
    firstDayOfWeek  = -1;
    use24HourClock  = true;
    showSeconds     = false;
    padHours12Hour  = false;

    # ── Date Format ───────────────────────────────────────────────────────
    clockDateFormat = "";
    lockDateFormat  = "";

    # ── Clock Widget ──────────────────────────────────────────────────────
    clockCompactMode = false;
  };
}
