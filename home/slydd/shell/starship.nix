{config, pkgs, ...}:
{
  programs.starship = {
    enable = true;
    enableTransience = true;
    enableZshIntegration = true;

    settings = {
      format = "$os$nix_shell$username$directory$git_status$character ";
      continuation_prompt = "-> ";
      scan_timeout = 10;
      add_newline = true;
      line_break.disabled = true;

      palette = "matugen";
      palettes.matugen = {
        foreground = config.theme.colorscheme.foreground;
        accent = config.theme.colorscheme.accent;
        secondary = config.theme.colorscheme.secondary;
        error = config.theme.colorscheme.error;
      };

      os = {
        style = "fg:accent";
        disabled = false;
        symbols.NixOS = "";
      };

      directory = {
        truncation_length = 2;
        truncate_to_repo = true;
        format = " [$read_only]($read_only_style)[$path]($style)";
        repo_root_format = " [$read_only]($read_only_style)[$repo_root]($repo_root_style)[$path]($style)";
        read_only = " ";
        style = "fg:foreground";
        read_only_style = "fg:error";
        repo_root_style = "fg:accent";
      };

      username = {
        style_root = "fg:error";
        style_user = "fg:accent";
        format = " [$user]($style)";
        show_always = true;
        aliases.root = "󰈸";
      };

      git_status = {
        style = "fg:secondary";
        format = " [$all_status$ahead_behind]($style)";
        conflicted = "=$count ";
        ahead = "⇡$count ";
        behind = "⇣$count ";
        untracked = "?$count ";
        stashed = "$$count ";
        modified = "!$count ";
        staged = "+$count ";
        renamed = "»$count ";
        deleted = "✘$count ";
      };

      character.format = " [$symbol](fg:foreground)";

      nix_shell = {
        disabled = false;
        format = ''[ \($name\)]($style)'';
        style = "fg:accent";
      };
    };
  };
}
