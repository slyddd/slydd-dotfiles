local mainMod = "SUPER"

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness raise"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"),
  { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("swayosd-client --media next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("swayosd-client --media play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("swayosd-client --media play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("swayosd-client --media previous"), { locked = true })

--- Keyboard Brightness
hl.bind("SHIFT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --keyboard-brightness raise"))
hl.bind("SHIFT + XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --keyboard-brightness lower"))
