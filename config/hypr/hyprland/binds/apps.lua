local mainMod     = "SUPER"

-- Default programs
local terminal    = "kitty"
local fileManager = "nautilus"
local menu        = "rofi -show drun -show-icons"
local browser     = "zen-browser"
local monitor     = "kitty -e btop"
local passwords   = "bitwarden-desktop"

hl.bind(mainMod .. " + SUPER_L", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + Escape", hl.dsp.exec_cmd(monitor))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(passwords))
