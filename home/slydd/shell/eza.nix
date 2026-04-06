{...}:
{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    colors = "always";
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
    git = true;
    icons = "always";
  };
}
