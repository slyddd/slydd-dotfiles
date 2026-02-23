# Core System & Boot
AddPackage base
AddPackage base-devel
AddPackage efibootmgr
AddPackage grub
AddPackage grub-btrfs
AddPackage sbctl
AddPackage sudo
AddPackage plymouth

# Kernel & Firmware
AddPackage intel-ucode
AddPackage linux
AddPackage linux-firmware
AddPackage linux-headers
AddPackage linux-zen
AddPackage linux-zen-headers

# Filesystems & Storage
AddPackage btrfs-progs
AddPackage rsync
AddPackage timeshift
AddPackage zram-generator
AddPackage --foreign timeshift-autosnap

# Security & Firewall
AddPackage iptables-nft
AddPackage reflector
AddPackage sbctl
AddPackage ufw

# Networking & Connectivity
AddPackage bluez
AddPackage bluez-utils
AddPackage blueman
AddPackage ethtool
AddPackage networkmanager
AddPackage openssh
AddPackage syncthing
AddPackage tailscale
AddPackage kdeconnect

# Audio
AddPackage alsa-utils
AddPackage pipewire
AddPackage pipewire-jack
AddPackage pipewire-pulse
AddPackage sof-firmware
AddPackage --foreign pwvucontrol

# Video & Graphics
AddPackage libva-intel-driver
AddPackage libva-utils
AddPackage seatd
AddPackage vulkan-icd-loader
AddPackage vulkan-intel
AddPackage vulkan-tools
AddPackage xorg-xauth
AddPackage --foreign xrdp
AddPackage --foreign xorgxrdp
AddPackage v4l2loopback-dkms
AddPackage v4l2loopback-utils
AddPackage --foreign droidcam-git
AddPackage --foreign droidcam-obs-plugin-git

# Desktop Environments
AddPackage cinnamon

# Display Managers
AddPackage ly

# Window Managers
AddPackage hyprland
AddPackage xdg-desktop-portal-hyprland
AddPackage hypridle
AddPackage hyprpolkitagent
AddPackage hyprlock

# Appearance: Themes, Icons, Fonts, Cursors
AddPackage orchis-theme
AddPackage ttf-firacode-nerd
AddPackage --foreign ttf-joypixels
AddPackage --foreign ttf-ms-win11-auto
AddPackage --foreign bibata-cursor-theme
AddPackage --foreign dms-shell-bin
AddPackage --foreign kora-icon-theme

# Terminal Emulators
AddPackage kitty

# CLI Utilities
AddPackage 7zip
AddPackage acpid
AddPackage bat
AddPackage btop
AddPackage brightnessctl
AddPackage chafa
AddPackage cliphist
AddPackage duckdb
AddPackage eza
AddPackage fastfetch
AddPackage fzf
AddPackage glow
AddPackage jq
AddPackage less
AddPackage neovim
AddPackage nix
AddPackage ouch
AddPackage perl-image-exiftool
AddPackage starship
AddPackage stow
AddPackage tar
AddPackage --foreign tdf-git
AddPackage tmux
AddPackage unzip
AddPackage wev
AddPackage wl-clipboard
AddPackage yazi
AddPackage zsh

# Productivity & User Applications
AddPackage blueman
AddPackage chromium
AddPackage flameshot
AddPackage fuzzel
AddPackage obsidian
AddPackage spotify-launcher
AddPackage tailscale
AddPackage zed
AddPackage inkscape
AddPackage obs-studio
AddPackage --foreign discord-ptb
AddPackage --foreign enpass-bin
AddPackage --foreign rambox-pro-bin
AddPackage --foreign zen-browser-bin

# Office Suites (English and Spanish support)
AddPackage libreoffice-fresh
AddPackage libreoffice-fresh-en-gb
AddPackage libreoffice-fresh-es
AddPackage hunspell
AddPackage hunspell-en_US
AddPackage hunspell-en_GB
AddPackage hunspell-es_any
AddPackage hyphen
AddPackage hyphen-en
AddPackage hyphen-es
AddPackage mythes-en
AddPackage mythes-es
AddPackage --foreign onlyoffice-bin
AddPackage aspell
AddPackage aspell-en
AddPackage aspell-es

# Gaming
AddPackage gamescope
AddPackage retroarch
AddPackage retroarch-assets-ozone
AddPackage retroarch-assets-xmb
AddPackage steam
AddPackage prismlauncher
AddPackage --foreign apollo-git
AddPackage --foreign heroic-games-launcher-bin
AddPackage --foreign rmg-bin
AddPackage --foreign steam-rom-manager-bin

# Emulation: Libretro Cores & Assets
AddPackage libretro-core-info
AddPackage libretro-mesen
AddPackage libretro-mgba
AddPackage libretro-mupen64plus-next
AddPackage libretro-shaders-slang
AddPackage libretro-snes9x

# Development Tools
AddPackage docker
AddPackage docker-compose
AddPackage git
AddPackage github-cli
AddPackage --foreign penpot-desktop-bin

# Programming Languages & Web Development
AddPackage bun
AddPackage nodejs

# Android Development
AddPackage --foreign android-sdk-platform-tools

# Qt & Multimedia Libraries
AddPackage qt6-multimedia-ffmpeg
AddPackage qt6-svg
AddPackage qt6-virtualkeyboard

# AUR Helpers & Package Management
AddPackage flatpak
AddPackage flatpak-builder
AddPackage --foreign aconfmgr-git
AddPackage --foreign paru-git
AddPackage --foreign paru-git-debug
