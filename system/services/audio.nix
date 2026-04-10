{ pkgs, ... }:

{
  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    pulse.enable = true;
    jack.enable = true;
  };

  services.pipewire.wireplumber.enable = true;
  services.pulseaudio.enable = false;

  environment.systemPackages = with pkgs; [
    pwvucontrol
    wireplumber
  ];

  services.pipewire.wireplumber.extraConfig."11-bluetooth-policy" = {
    "wireplumber.settings" = {
      "bluetooth.autoswitch-to-headset-profile" = false;
    };
  };
}
