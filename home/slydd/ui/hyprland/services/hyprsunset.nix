{ ... }:
{
  services.hyprsunset = {
    enable = true;
    settings = {
      max-gamma = 100;

      profile = [
        {
          time = "6:00";
          identity = true;
        }
        {
          time = "19:00";
          temperature = 3500;
        }
      ];
    };
  };
}
