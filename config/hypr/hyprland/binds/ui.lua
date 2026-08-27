hl.bind(MainMod .. " + SHIFT + R", hl.dsp.exec_cmd("pkill -SIGUSR2 waybar || waybar"))
hl.bind(MainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(MainMod .. " + ESCAPE",
  hl.dsp.exec_cmd("rofi -show power -theme grid"))
hl.bind(MainMod .. " + V", hl.dsp.exec_cmd("rofi -show clipboard -show-icons"))
hl.bind(MainMod .. " + Period",
  hl.dsp.exec_cmd("rofi -modi 'combi' -combi-modi 'emoji,nerdy' -combi-hide-mode-prefix -show combi"))
hl.bind(MainMod .. " + P", hl.dsp.exec_cmd("rofi-rbw --no-help"))
hl.bind(MainMod .. " + SHIFT + P", hl.dsp.exec_cmd("rofi-rbw"))
hl.bind(MainMod .. " + G", hl.dsp.exec_cmd("rofi -show games -show-icons"))
hl.bind(MainMod .. " + C", hl.dsp.exec_cmd("hyprpicker -a -c"))

--- Screenshots
local function execShot(full)
  local fileName = os.date("$HOME/Pictures/Screenshots/%Y-%m-%d-%H%M%S_shot.png")
  local grim
  local wl = 'wl-copy < "' .. fileName .. '"'
  local notif = 'notify-send "Screenshot" "Saved to ' .. fileName .. '"'

  if full then
    grim = 'grim "' .. fileName .. '" && wl-copy < "' .. fileName .. '"'
  else
    grim = 'grim -g "$(slurp)" "' .. fileName .. '" && wl-copy < "' .. fileName .. '"'
  end

  local command = grim .. ' && ' .. wl .. ' && ' .. notif
  return command
end

hl.bind("Print", function()
  local command = execShot(false)
  hl.dispatch(hl.dsp.exec_cmd(command))
end)
hl.bind("SHIFT + Print", function()
  local command = execShot(true)
  hl.dispatch(hl.dsp.exec_cmd(command))
end)

-- External Keyboard Screenshots
hl.bind("Insert", function()
  local command = execShot(false)
  hl.dispatch(hl.dsp.exec_cmd(command))
end)
hl.bind("SHIFT + Insert", function()
  local command = execShot(true)
  hl.dispatch(hl.dsp.exec_cmd(command))
end)
