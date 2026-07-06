-- ╔═╗┬ ┬ ┬┌┬┐┌┬┐  ┌┬┐┌─┐┌┬┐┌─┐
-- ╚═╗│ └┬┘ ││ ││───│││ │ │ └─┐
-- ╚═╝┴─┘┴ ─┴┘─┴┘  ─┴┘└─┘ ┴ └─┘
-- Hyprland Configuration File
require("hyprland/keybinds")
require("hyprland/binds")
require("hyprland/autostart")
require("hyprland/env")
require("hyprland/ui")
require("hyprland/rules")


---- MONITORS ----
hl.monitor({
  output   = "",
  mode     = "preferred",
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
    kb_layout    = "us",
    kb_variant   = "altgr-intl",
    follow_mouse = 1,

    touchpad     = {
      natural_scroll = true,
      disable_while_typing = false,
    },
  },
})
