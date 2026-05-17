{ pkgs, ... }:
{
  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 10d";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    android_sdk.accept_license = true;
  };

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      zlib
      zstd
      stdenv.cc.cc
      curl
      openssl
      libX11
      libXext
      libXrandr
      libXfixes
      libXcomposite
      libxcb
      libXdamage
      libxshmfence
      libXxf86vm
      libGL
      libdrm
      libgbm
      pipewire
      glib
      gtk3
      nspr
      nss
      dbus
      alsa-lib
      pango
      cairo
      atk
      gdk-pixbuf
      fontconfig
      freetype
      expat
      libxkbcommon
      cups
    ];
  };
}
