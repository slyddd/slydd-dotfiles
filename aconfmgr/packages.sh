# Core System
AddPackage base
AddPackage base-devel
AddPackage linux
AddPackage linux-firmware
AddPackage linux-headers
AddPackage linux-zen
AddPackage linux-zen-headers
AddPackage intel-ucode
AddPackage efibootmgr
AddPackage grub
AddPackage grub-btrfs
AddPackage sbctl
AddPackage sudo
AddPackage plymouth

# Filesystems & Storage
AddPackage btrfs-progs
AddPackage timeshift
AddPackage rsync
AddPackage zram-generator

# Networking
AddPackage networkmanager
AddPackage openssh
AddPackage iptables-nft
AddPackage reflector
AddPackage ufw
AddPackage bluez
AddPackage bluez-utils
AddPackage ethtool
AddPackage syncthing

# Audio
AddPackage alsa-utils
AddPackage pipewire
AddPackage pipewire-jack
AddPackage pipewire-pulse
AddPackage sof-firmware

# Video
AddPackage vulkan-icd-loader
AddPackage vulkan-intel
AddPackage vulkan-tools
AddPackage xorg-xauth
AddPackage seatd
AddPackage libva-intel-driver
AddPackage libva-utils
AddPackage --foreign xrdp
AddPackage --foreign xorgxrdp

# Desktop Environments & Window Managers
AddPackage cinnamon
AddPackage ly
AddPackage hyprland
## Hyprland Extras
AddPackage --foreign hyprland-plugin-hyprexpo
AddPackage --foreign hyprland-plugin-hyprscrolling

# Themes, Icons, Fonts
AddPackage orchis-theme
AddPackage ttf-firacode-nerd
AddPackage --foreign dms-shell-bin

# CLI Tools
AddPackage acpid
AddPackage bat
AddPackage eza
AddPackage fastfetch
AddPackage fzf
AddPackage less
AddPackage neovim
AddPackage starship
AddPackage stow
AddPackage tmux
AddPackage yazi
AddPackage zsh
AddPackage exiftool
AddPackage mdcat
AddPackage 7zip
AddPackage tar
AddPackage unzip
AddPackage chafa
AddPackage btop
AddPackage wl-clipboard
AddPackage cliphist
AddPackage perl-image-exiftool
AddPackage jq
AddPackage wev
AddPackage nix
AddPackage brightnessctl

# User Programs
AddPackage kitty
AddPackage zed
AddPackage flameshot
AddPackage spotify-launcher
AddPackage blueman
AddPackage tailscale
AddPackage fuzzel

# Game
AddPackage gamescope
AddPackage steam
AddPackage retroarch
AddPackage retroarch-assets-xmb
AddPackage retroarch-assets-ozone
AddPackage --foreign apollo-git
AddPackage --foreign heroic-games-launcher-bin
AddPackage --foreign rmg-bin
AddPackage --foreign steam-rom-manager-bin
## Libretro
AddPackage libretro-core-info
AddPackage libretro-shaders-slang
AddPackage libretro-mupen64plus-next
AddPackage libretro-snes9x
AddPackage libretro-mgba
AddPackage libretro-mesen

# Development Tools
AddPackage git
AddPackage github-cli
## Web Development
AddPackage nodejs
AddPackage bun
## Android
AddPackage --foreign android-sdk-platform-tools

# Qt & Multimedia
AddPackage qt6-multimedia-ffmpeg
AddPackage qt6-svg
AddPackage qt6-virtualkeyboard

# AUR/Foreign Packages
AddPackage --foreign aconfmgr-git
AddPackage --foreign bibata-cursor-theme
AddPackage --foreign enpass-bin
AddPackage --foreign kora-icon-theme
AddPackage --foreign paru-git
AddPackage --foreign paru-git-debug
AddPackage --foreign timeshift-autosnap
AddPackage --foreign zen-browser-bin
AddPackage --foreign discord-ptb
