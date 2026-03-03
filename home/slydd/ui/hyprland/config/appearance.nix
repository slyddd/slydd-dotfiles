{...}:
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 8;
      gaps_out = 20;

      border_size = 1;
      layout = "scrolling";
    };

    scrolling = {
      column_width = 0.9;
      fullscreen_on_one_column = true;
      focus_fit_method = 1;
    };

    decoration = {
      rounding = 12;
      rounding_power = 5;

      active_opacity = 1.0;
      inactive_opacity = 0.6;
      dim_inactive = true;

      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
      };

      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        noise = 0.2;
        vibrancy = 0.1696;
      };
    };

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
    };
  };
}
