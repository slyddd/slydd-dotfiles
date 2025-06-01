{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };

      background = [
        {
          monitor = "";
          path = "screenshot";
          blur_passes = 2;
          blur_size = 2;
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          font_size = 12;
          font_family = "FiraCode Nerd Font";
          position = "0, 50";
          valign = "center";
          halign = "center";
        }
        {
          monitor = "";
          text = "You're locked!";
          font_size = 12;
          font_family = "FiraCode Nerd Font";
          position = "0, -50";
          valign = "center";
          halign = "center";
        }
        {
          monitor = "";
          text = "$FAIL";
          font_size = 9;
          font_family = "FiraCode Nerd Font";
          color = "rgb(255,0,0)";
          position = "0, -100";
          valign = "center";
          halign = "center";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "50, 50";
          outline_thickness = 2;
          hide_input = true;
          fade_on_empty = true;
          placeholder_text = "";
          inner_color = "rgba(0,0,0,0)";
          outer_color = "rgba(0,0,0,0)";
          check_color = "rgba(255, 255, 255, 0.5)";
          fail_text = "";
          fail_color = "rgb(255,0,0)";
          position = "0, 0";
          valign = "center";
          halign = "center";
        }
      ];
    };
  };
}
