local mainMod = "SUPER"

hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("pkill -SIGUSR2 waybar || waybar"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + ESCAPE",
  hl.dsp.exec_cmd(
    "rofi -show powermenu -modi powermenu:$HOME/.local/bin/rofi-power-menu -theme-str 'listview {columns:3; lines: 2; scrollbar: false;} inputbar {enabled: false;} element {orientation: vertical;}'"))

-- Noctalia
-- hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(noctalia .. "launcher clipboard"))
-- hl.bind(mainMod .. " + Period", hl.dsp.exec_cmd(noctalia .. "launcher emoji"))
