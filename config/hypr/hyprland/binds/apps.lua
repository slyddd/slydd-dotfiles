-- Default programs
local terminal    = "kitty"
local fileManager = "nautilus"
local menu        = "rofi -show drun -show-icons"
local browser     = "zen-browser"
local monitor     = "kitty -e btop"

hl.bind(MainMod .. " + SUPER_L", hl.dsp.exec_cmd(menu))
hl.bind(MainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(MainMod .. " + SHIFT + Return",
  hl.dsp.exec_cmd(terminal, { float = true, size = { 900, 600 } }))
hl.bind(MainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(MainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(MainMod .. " + SHIFT + E",
  hl.dsp.exec_cmd(fileManager, { float = true, size = { 900, 600 } }))
hl.bind(MainMod .. " + SHIFT + Escape", hl.dsp.exec_cmd(monitor))
