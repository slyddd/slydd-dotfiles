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

      palette = "catppuccin_mocha";
      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };

      os = {
        style = "fg:sky";
        disabled = false;
        symbols.NixOS = "";
      };

      directory = {
        truncation_length = 2;
        truncate_to_repo = true;
        format = " [$read_only]($read_only_style)[$path]($style)";
        repo_root_format = " [$read_only]($read_only_style)[$repo_root]($repo_root_style)[$path]($style)";
        read_only = " ";
        style = "fg:blue";
        read_only_style = "fg:blue";
        repo_root_style = "fg:yellow";
      };

      username = {
        style_root = "fg:blue";
        style_user = "fg:blue";
        format = " [$user]($style)";
        show_always = true;
        aliases.root = "󰈸";
      };

      git_status = {
        style = "fg:yellow";
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

      character.format = " [$symbol](fg:blue)";

      nix_shell = {
        disabled = false;
        format = ''[ \($name\)]($style)'';
        style = "fg:sky";
      };
    };
  };
}
