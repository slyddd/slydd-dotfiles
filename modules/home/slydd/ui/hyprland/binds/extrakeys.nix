{
  wayland.windowManager.hyprland.settings = {
    binddle = [
      ", XF86AudioRaiseVolume, Increase Volume, exec, volumectl up 5"
      ", XF86AudioLowerVolume, Decrease Volume, exec, volumectl down 5"
      ", XF86AudioMute, Toggle Mute, exec, volumectl toggle-mute"
      ", XF86AudioMicMute, Toggle Microphone Mute, exec, volumectl toggle-mic-mute"
      ", XF86BrightnessUp, Increase Brightness, exec, lightctl up 5"
      ", XF86BrightnessDown, Decrease Brightness, exec, lightctl down 5"
    ];
  };
}
