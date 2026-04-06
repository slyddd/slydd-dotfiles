{...}:
{
  programs.dank-material-shell.settings = {
    # ── GTK / Qt Theming ──────────────────────────────────────────────────
    gtkThemingEnabled  = true;
    qtThemingEnabled   = true;
    syncModeWithPortal = true;
    terminalsAlwaysDark = true;

    # ── Matugen Templates ─────────────────────────────────────────────────
    runDmsMatugenTemplates      = true;
    matugenTemplateGtk          = true;
    matugenTemplateHyprland     = true;
    matugenTemplateQt5ct        = true;
    matugenTemplateQt6ct        = true;
    matugenTemplateZenBrowser   = true;
    matugenTemplateKitty        = true;
    matugenTemplateNeovim       = true;
  };
}
