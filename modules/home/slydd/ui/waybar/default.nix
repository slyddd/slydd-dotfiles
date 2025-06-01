{ config, ... }:
{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      spacing = 10;
      margin = "5 20 0 20";
      "modules-left" = [
        "custom/os"
        "user"
      ];
      "modules-center" = [
        "hyprland/workspaces"
      ];
      "modules-right" = [
        "tray"
        "network"
        "pulseaudio"
        "clock"
        "battery"
        "hyprland/submap"
        "keyboard-state"
      ];

      "custom/os" = {
        exec = "echo ";
        "on-click" = "fuzzel";
        tooltip = false;
      };
      "user" = {
        format = "{user}";
      };

      "hyprland/workspaces" = {
        "all-outputs" = true;
        "format" = "{icon}";
        "format-icons" = {
          active = "󰮯";
          default = "󰊠";
          empty = "";
        };
        "persistent-workspaces" = {
          "*" = 10;
        };
      };

      "network" = {
        format = "{icon}";
        "format-icons" = {
          connected = "󰖩";
          disconnected = "";
          wifi = "󰖩";
          ethernet = "";
        };
        "tooltip-format" = "{essid}: {ipaddr}";
        "on-click" = "kitty -e nmtui";
      };

      "pulseaudio" = {
        format = "{icon}";
        "format-icons" = {
          default = "󰕾";
          "default-muted" = "";
          headphones = "󰋎";
          "headphones-muted" = "󰋐";
          speakers = "󰦢";
          "speakers-muted" = "󰓄";
        };
        "tooltip-format" = "{desc}: {volume}%";
      };

      "clock" = {
        tooltip = true;
        "tooltip-format" = "{:%Y-%m-%d}";
      };

      "battery" = {
        format = ".";
        bat = "BAT1";
        "tooltip-format" = "{capacity}%: {time}";
        "states" = {
          "full" = 100;
          "normal" = 90;
          "high" = 50;
          "warning" = 30;
          "critical" = 15;
        };
        tooltip = true;
      };

      "keyboard-state" = {
        capslock = true;
        format = "{icon}";
        "format-icons" = {
          locked = "󰪛";
          unlocked = "";
        };
      };
    };

    style =
      let
        inherit (config.theme) colorscheme;
      in
      ''
        * {
          border: none;
          border-radius: 0;
          font-family: Source Code Pro;
          background: transparent;
          color: ${colorscheme.text};
        }

        #workspaces button {
          padding: 0 5px;
        }

        #workspaces button:hover {
          background: transparent;
        }

        #network {
          padding: 0 5px;
        }

        #pulseaudio {
          padding: 0 5px;
        }

        #battery {
          padding: 0 5px;
          border-radius: 9999px;
          font-size: 0.1px;
        }

        #battery.charging {
          animation: pulse 5s infinite;
        }

        @keyframes pulse {
          0% {
            opacity: 0.25;
          }
          50% {
            opacity: 1;
          }
          100% {
            opacity: 0.25;
          }
        }

        #battery.full {
          background: #00A001;
          color: #00A001;
        }

        #battery.normal {
          background: #fff;
          color: #00A061;
        }

        #battery.high {
          background: #00A0A0;
          color: #00A0A0;
        }

        #battery.critical {
          background: #A00101;
          color: #A00101;
        }

        #battery.warning {
          background: #A06101;
          color: #A06101;
        }

        #custom-os {
          padding: 0 5px;
        }

        #keyboard-state .locked {
          padding: 0 5px;
        }
      '';
  };
}
