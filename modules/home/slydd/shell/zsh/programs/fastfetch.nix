{ config, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "${config.theme.logo}";
        width = 25;
        padding = {
          right = 5;
          top = 4;
          left = 5;
        };
      };

      general.multithreading = true;

      display.separator = "➜   ";

      modules = [
        "break"
        {
          type = "title";
          format = "                                {6}{7}{8}";
        }
        "break"
        {
          type = "custom";
          format = "┌──────────────────────────────────────────────────────────────────────────────┐";
        }
        "break"
        {
          key = "               ";
          type = "os";
        }
        {
          key = "    󰌢           ";
          type = "host";
        }
        {
          key = "               ";
          type = "kernel";
        }
        {
          key = "               ";
          type = "wm";
        }
        {
          key = "               ";
          type = "shell";
        }
        {
          key = "    󰻠           ";
          type = "cpu";
        }
        {
          key = "    󰍛           ";
          type = "gpu";
        }
        {
          key = "    󰑭           ";
          type = "memory";
        }
        {
          key = "    󰍛           ";
          type = "disk";
        }
        {
          key = "               ";
          type = "wifi";
        }
        {
          key = "    󰩟           ";
          type = "localip";
          compact = true;
        }
        "break"
        {
          type = "custom";
          format = "└──────────────────────────────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "colors";
          paddingLeft = 31;
          symbol = "circle";
          block.width = 10;
        }
      ];
    };
  };
}
