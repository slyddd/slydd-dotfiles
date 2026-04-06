{...}:
{
  systemd.user.services.dms = {
    Unit = {
      After = [ "hyprland-session.target" ];
      Wants = [ "hyprland-session.target" ];
      PartOf = [ "hyprland-session.target" ];
    };

    Install = {
      WantedBy = [ "hyprland-session.target" ];
    };

    Service = {
      Restart = "on-failure";
      RestartSec = 2;
    };
  };
}
