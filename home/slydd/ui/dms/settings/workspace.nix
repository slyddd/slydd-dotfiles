{...}:
{
  programs.dank-material-shell.settings = {
    # ── Visibility ────────────────────────────────────────────────────────
    showWorkspaceIndex        = false;
    showWorkspaceName         = false;
    showWorkspacePadding      = false;
    showWorkspaceApps         = false;
    showOccupiedWorkspacesOnly = false;

    # ── Behavior ──────────────────────────────────────────────────────────
    workspaceScrolling        = true;
    workspaceDragReorder      = false;
    workspaceFollowFocus      = false;
    reverseScrolling          = false;
    dwlShowAllTags            = false;

    # ── Icons ─────────────────────────────────────────────────────────────
    maxWorkspaceIcons         = 3;
    workspaceAppIconSizeOffset = 0;
    groupWorkspaceApps        = true;

    # ── Colors ────────────────────────────────────────────────────────────
    workspaceColorMode          = "default";
    workspaceOccupiedColorMode  = "none";
    workspaceUnfocusedColorMode = "default";
    workspaceUrgentColorMode    = "default";

    # ── Focused Border ────────────────────────────────────────────────────
    workspaceFocusedBorderEnabled   = false;
    workspaceFocusedBorderColor     = "primary";
    workspaceFocusedBorderThickness = 2;

    # ── Name Icons ────────────────────────────────────────────────────────
    workspaceNameIcons = {};
  };
}
