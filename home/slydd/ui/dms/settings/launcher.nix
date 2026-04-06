{...}:
{
  programs.dank-material-shell.settings = {
    # ── App Launcher ──────────────────────────────────────────────────────
    appLauncherViewMode    = "list";
    sortAppsAlphabetically = false;
    appLauncherGridColumns = 4;

    # ── Dank Launcher V2 ──────────────────────────────────────────────────
    dankLauncherV2Size           = "compact";
    dankLauncherV2BorderEnabled  = false;
    dankLauncherV2BorderThickness = 0;
    dankLauncherV2BorderColor    = "primary";
    dankLauncherV2ShowFooter     = false;
    dankLauncherV2UnloadOnClose  = false;

    # ── Launcher Logo ─────────────────────────────────────────────────────
    launcherLogoMode            = "os";
    launcherLogoCustomPath      = "";
    launcherLogoColorOverride   = "";
    launcherLogoColorInvertOnMode = false;
    launcherLogoBrightness      = 0.5;
    launcherLogoContrast        = 1;
    launcherLogoSizeOffset      = 0;

    # ── App ID Substitutions ──────────────────────────────────────────────
    appIdSubstitutions = [
    ];
  };
}
