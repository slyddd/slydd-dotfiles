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

# Audio
AddPackage alsa-utils
AddPackage pipewire
AddPackage pipewire-jack
AddPackage pipewire-pulse
AddPackage sof-firmware

# Desktop Environments & Window Managers
AddPackage cinnamon
AddPackage --foreign mangowc-git
AddPackage qtile
AddPackage sddm

# Themes, Icons, Fonts
AddPackage orchis-theme
AddPackage ttf-firacode-nerd
AddPackage sddm-astronaut-theme
AddPackage --foreign dms-shell-bin

# CLI Tools
AddPackage acpid
AddPackage bat
AddPackage eza
AddPackage fastfetch
AddPackage fzf
AddPackage git
AddPackage github-cli
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
AddPackage perl-image-exiftool
AddPackage btop

# User Programs
AddPackage kitty
AddPackage zed
AddPackage flameshot
AddPackage spotify-launcher
AddPackage blueman


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
