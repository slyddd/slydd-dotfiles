{
  services.cliphist = {
    enable = true;
    allowImages = true;
    systemdTargets = "graphical-session.target";
    extraOptions = [
      "-max-dedupe-search"
      "10"
      "-max-items"
      "100"
    ];
  };
}
