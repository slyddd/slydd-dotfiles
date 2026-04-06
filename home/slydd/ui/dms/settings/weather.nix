{...}:
{
  programs.dank-material-shell.settings = {
    # ── Location ──────────────────────────────────────────────────────────
    useAutoLocation   = true;

    # ── Weather ───────────────────────────────────────────────────────────
    weatherEnabled    = true;
    networkPreference = "auto";

    # ── Units ─────────────────────────────────────────────────────────────
    useFahrenheit = false;
    windSpeedUnit = "kmh";
  };
}
