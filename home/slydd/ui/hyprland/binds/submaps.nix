{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod, R, submap, resize_mode"
      "$mainMod, M, submap, move_mode"
    ];
  };

  wayland.windowManager.hyprland.submaps = {
    resize_mode.settings = {
      binde = [
        # Normal Resize
        ", l, resizeactive, -10 0"
        ", h, resizeactive, 10 0"
        ", j, resizeactive, 0 10"
        ", k, resizeactive, 0 -10"
        ", right, resizeactive, 10 0"
        ", left, resizeactive, -10 0"
        ", up, resizeactive, 0 -10"
        ", down, resizeactive, 0 10"

        # Fine Resize
        "SHIFT, l, resizeactive, -1 0"
        "SHIFT, h, resizeactive, 1 0"
        "SHIFT, j, resizeactive, 0 1"
        "SHIFT, k, resizeactive, 0 -1"
        "SHIFT, right, resizeactive, 1 0"
        "SHIFT, left, resizeactive, -1 0"
        "SHIFT, up, resizeactive, 0 -1"
        "SHIFT, down, resizeactive, 0 1"

        # Fast Resize
        "CTRL, l, resizeactive, -20 0"
        "CTRL, h, resizeactive, 20 0"
        "CTRL, j, resizeactive, 0 20"
        "CTRL, k, resizeactive, 0 -20"
        "CTRL, right, resizeactive, 20 0"
        "CTRL, left, resizeactive, -20 0"
        "CTRL, up, resizeactive, 0 -20"
        "CTRL, down, resizeactive, 0 20"
      ];

      bind = [
        ", SPACE, submap, move_mode"
        ", ESCAPE, submap, reset"
      ];
    };

    move_mode.settings = {
      binde = [
        # Normal Move
        ", l, moveactive, 10 0"
        ", h, moveactive, -10 0"
        ", j, moveactive, 0 10"
        ", k, moveactive, 0 -10"
        ", right, moveactive, 10 0"
        ", left, moveactive, -10 0"
        ", up, moveactive, 0 -10"
        ", down, moveactive, 0 10"

        # Fine Move
        "SHIFT, l, moveactive, 1 0"
        "SHIFT, h, moveactive, -1 0"
        "SHIFT, j, moveactive, 0 1"
        "SHIFT, k, moveactive, 0 -1"
        "SHIFT, right, moveactive, 1 0"
        "SHIFT, left, moveactive, -1 0"
        "SHIFT, up, moveactive, 0 -1"
        "SHIFT, down, moveactive, 0 1"

        # Fast Move
        "CTRL, l, moveactive, 20 0"
        "CTRL, h, moveactive, -20 0"
        "CTRL, j, moveactive, 0 20"
        "CTRL, k, moveactive, 0 -20"
        "CTRL, right, moveactive, 20 0"
        "CTRL, left, moveactive, -20 0"
        "CTRL, up, moveactive, 0 -20"
        "CTRL, down, moveactive, 0 20"
      ];

      bind = [
        ", SPACE, submap, resize_mode"
        ", ESCAPE, submap, reset"
      ];
    };
  };
}
