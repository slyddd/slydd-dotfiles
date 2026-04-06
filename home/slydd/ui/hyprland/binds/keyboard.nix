{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$terminal" = "kitty";
    "$fileManager" = "kitty --class yazi -e yazi";
    "$guiFileManager" = "nemo";
    "$browser" = "zen-beta";
    "$taskManager" = "kitty -e btop";
    "$passwordManager" = "Enpass showassistant";

    bind = [
      "$mainMod, RETURN, exec, $terminal"
      "$mainMod SHIFT, RETURN, exec, $terminal --class fkitty"
      "$mainMod, B, exec, $browser"
      "$mainMod, E, exec, $fileManager"
      "$mainMod SHIFT, E, exec, $guiFileManager"
      "$mainMod SHIFT, ESCAPE, exec, $taskManager"
      "$mainMod, P, exec, $passwordManager"

      "$mainMod, SUPER_L, exec, dms ipc call spotlight toggle"
      "$mainMod, V, exec, dms ipc call clipboard toggle"
      "$mainMod, I, exec, dms ipc call settings focusOrToggle"
      "$mainMod, C, exec, dms color pick -a"
      "$mainMod, INSERT, exec, dms screenshot -d ~/Pictures/Screenshots"
      "$mainMod SHIFT, INSERT, exec, dms screenshot full -d ~/Pictures/Screenshots"
      "$mainMod, DELETE, exec, dms ipc call powermenu toggle"
      "$mainMod, D, exec, dms ipc call control-center toggle"
      "$mainMod SHIFT, D, exec, dms ipc call dash toggle \"\""

      "$mainMod, F, fullscreen,"
      "$mainMod SHIFT, F, togglefloating,"
      "$mainMod, T, pin,"
      "$mainMod, W, killactive,"
      "$mainMod SHIFT, W, forcekillactive,"

      "$mainMod, H, layoutmsg, focus left"
      "$mainMod, L, layoutmsg, focus right"
      "$mainMod, LEFT, layoutmsg, focus left"
      "$mainMod, RIGHT, layoutmsg, focus right"

      "$mainMod SHIFT, H, layoutmsg, swapcol l"
      "$mainMod SHIFT, L, layoutmsg, swapcol r"
      "$mainMod SHIFT, LEFT, layoutmsg, swapcol l"
      "$mainMod SHIFT, RIGHT, layoutmsg, swapcol r"

      "$mainMod CTRL, F, layoutmsg, promote"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, S, togglespecialworkspace,"
      "$mainMod, COMMA, workspace, m-1"
      "$mainMod, PERIOD, workspace, m+1"

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, S, movetoworkspace, special"
      "$mainMod SHIFT, COMMA, movetoworkspace, m-1"
      "$mainMod SHIFT, PERIOD, movetoworkspace, m+1"

      "$mainMod CTRL, Q, exit,"
      "$mainMod, ESCAPE, exec, pidof hyprlock || hyprlock"
      "ALT, TAB, cyclenext,"
    ];

    bindel = [
      ", XF86AudioRaiseVolume, exec, dms ipc call audio increment 3"
      "SHIFT, XF86AudioRaiseVolume, exec, dms ipc call audio increment 10"
      ", XF86AudioLowerVolume, exec, dms ipc call audio decrement 3"
      "SHIFT, XF86AudioLowerVolume, exec, dms ipc call audio decrement 10"
      ", XF86AudioMute, exec, dms ipc call audio mute"

      ", XF86MonBrightnessUp, exec, dms ipc call brightness increment 5 \"\""
      "SHIFT, XF86MonBrightnessUp, exec, dms ipc call brightness increment 15 \"\""
      ", XF86MonBrightnessDown, exec, dms ipc call brightness decrement 5 \"\""
      "SHIFT, XF86MonBrightnessDown, exec, dms ipc call brightness decrement 15 \"\""
    ];
  };
}
