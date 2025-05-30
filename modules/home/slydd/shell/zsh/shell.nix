{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
    };

    initContent = ''
      fastfetch
    '';

    history = {
      save = 5000;
      size = 5000;
      append = true;
      share = true;
      ignoreSpace = true;
      ignoreAllDups = true;
      saveNoDups = true;
      ignoreDups = true;
      findNoDups = true;
    };

    autocd = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/.nixos#";
      cat = "bat";
      ls = "eza";
      ll = "eza -l";
      la = "eza -a";
      lla = "eza -la";
    };
  };
}
