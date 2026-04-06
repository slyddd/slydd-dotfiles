{ pkgs, ... }:
{
  programs.gh = {
    enable = true;
    settings.git_protocol = "https";
  };

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      credential.helper = "!gh auth git-credential";
      credential.useHttpPath = true;

      user = {
        name = "slyddd";
        email = "dayvidnavarrete@gmail.com";
      };
    };
  };
}
