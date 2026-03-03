{...}:
{
  boot.loader.limine = {
    enable = true;
    maxGenerations = 20;

    extraConfig = ''
      timeout: 2
      quiet: yes
    '';

    secureBoot.enable = true;
  };
}
