{
  wayland.windowManager.hyprland.settings.decoration = {
    # Rounded borders
    rounding = 10;
    rounding_power = 2.0;

    # Focus
    ## Opacity
    active_opacity = 1.0;
    inactive_opacity = 0.6;
    fullscreen_opacity = 1.0;

    ## Dim
    dim_inactive = true;
    dim_strength = 0.6;
    dim_special = 0.8;
    dim_around = 0.8;

    # Blur
    blur = {
      enabled = true;
      size = 8;
      passes = 2;
      noise = 0.05;
      # contrast = 1.0;
      # brightness = 1.0;
      # vibrancy = 0.0;
      # vibrancy_darkness = 0.0;
    };

    # Shadows
    shadow = {
      enabled = true;
      range = 8;
      scale = 1.0;
      color = "0x000000ff";
    };
  };
}
