{...}:
{
  programs.dank-material-shell.settings = {
    # ── OSD General ───────────────────────────────────────────────────────
    osdAlwaysShowValue = true;
    osdPosition        = 3;

    # ── OSD Overlays ──────────────────────────────────────────────────────
    osdVolumeEnabled        = true;
    osdMediaVolumeEnabled   = true;
    osdMediaPlaybackEnabled = true;
    osdBrightnessEnabled    = true;
    osdIdleInhibitorEnabled = true;
    osdMicMuteEnabled       = true;
    osdCapsLockEnabled      = true;
    osdPowerProfileEnabled  = true;
    osdAudioOutputEnabled   = true;
  };
}
