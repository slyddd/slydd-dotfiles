# Set sddm settings
CopyFileTo /sddm/sddm.conf \
           /etc/sddm.conf.d/10-sddm.conf

# Set theme variant
CopyFileTo /sddm/astronaut-theme.desktop \
           /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
