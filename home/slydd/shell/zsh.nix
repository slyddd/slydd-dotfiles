{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    syntaxHighlighting.enable = true;
    autosuggestion = {
      enable = true;
      strategy = [ "history" "completion" ];
    };

    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
      }
    ];

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "sudo"
      ];
    };

    initContent = ''
      export PATH="$HOME/.local/bin:$HOME/.bun/bin:$PATH"
      export EDITOR="nvim"
      export SUDO_PROMPT="󰈸 Deploying root access for %u. Password pls: "
      export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"

      command_not_found_handler() {
        printf "%s%s? I don't know what is it  \n" "$acc" "$0" >&2
        return 127
      }

      fastfetch
    '';

    history = {
      save = 5000;
      size = 5000;
      path = "$HOME/.config/zsh/zsh_history";
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
      ls = "eza --icons=always";
      ll = "eza -l --icons=always";
      la = "eza -a --icons=always";
      lla = "eza -la --icons=always";
    };
  };
}
