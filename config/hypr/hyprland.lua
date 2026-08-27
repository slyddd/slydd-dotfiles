-- ╔═╗┬ ┬ ┬┌┬┐┌┬┐  ┌┬┐┌─┐┌┬┐┌─┐
-- ╚═╗│ └┬┘ ││ ││───│││ │ │ └─┐
-- ╚═╝┴─┘┴ ─┴┘─┴┘  ─┴┘└─┘ ┴ └─┘
-- Hyprland Configuration File
require("hyprland/binds")
require("hyprland/autostart")
require("hyprland/env")
require("hyprland/ui")
require("hyprland/rules")


---- MONITORS ----
hl.monitor({
  output   = "",
  mode     = "highres",
  position = "auto",
  scale    = "1",
})
hl.monitor({
  output   = "HDMI-A-1",
  mode     = "1920x1080@60.00Hz",
  position = "auto",
  scale    = "1",
})

----  MISC  ----
hl.config({
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo   = true,
  },
})


---- INPUT ----
hl.config({
  input = {
    kb_layout                   = "us",
    kb_variant                  = "altgr-intl",
    kb_model                    = "thinkpad",
    follow_mouse                = 0,
    float_switch_override_focus = 0,

    touchpad                    = {
      natural_scroll = true,
      disable_while_typing = false,
    },
  },
})
