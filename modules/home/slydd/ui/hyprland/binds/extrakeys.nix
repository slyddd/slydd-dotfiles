{
  wayland.windowManager.hyprland.settings = {
    binddle = [
      ", XF86AudioRaiseVolume, Increase Volume, exec, volumectl up 5"
      ", XF86AudioLowerVolume, Decrease Volume, exec, volumectl down 5"
      ", XF86AudioMute, Toggle Mute, exec, volumectl toggle-mute"
      ", XF86AudioMicMute, Toggle Microphone Mute, exec, volumectl toggle-mic-mute"
      ", XF86MonBrightnessUp, Increase Brightness, exec, lightctl up 5"
      ", XF86MonBrightnessDown, Decrease Brightness, exec, lightctl down 5"
      ", XF86WLAN, Toggle Wi-Fi, exec, networkctl toggle-network"
    ];
  };
}
