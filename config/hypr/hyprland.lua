-- require("myColors")
require("keybinds")
require("autostart")
require("env")
require("ui")
require("rules")


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
    force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
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
