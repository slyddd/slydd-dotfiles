{ config, lib, pkgs, ... }:
let
  c = config.theme.colorscheme;
  themeName = "Matugen";
in
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = themeName;
      truecolor = true;
      theme_background = false;
      vim_keys = true;
    };
  };

  xdg.configFile."btop/themes/${themeName}.theme".text = ''
    # Generated from matugen -> theme.colorscheme

    theme[main_bg]="${c.base}"
    theme[main_fg]="${c.text}"
    theme[title]="${c.accent}"
    theme[hi_fg]="${c.accent}"

    theme[selected_bg]="${c.secondary}"
    theme[selected_fg]="${c.text}"
    theme[inactive_fg]="${c.secondary}"
    theme[graph_text]="${c.text}"
    theme[proc_misc]="${c.secondary}"

    theme[cpu_box]="${c.secondary}"
    theme[mem_box]="${c.secondary}"
    theme[net_box]="${c.secondary}"
    theme[proc_box]="${c.secondary}"
    theme[div_line]="${c.secondary}"

    theme[temp_start]="${c.accent}"
    theme[temp_mid]="${c.secondary}"
    theme[temp_end]="${c.error}"

    theme[cpu_start]="${c.accent}"
    theme[cpu_mid]="${c.secondary}"
    theme[cpu_end]="${c.error}"

    theme[free_start]="${c.secondary}"
    theme[free_mid]=""
    theme[free_end]="${c.accent}"

    theme[cached_start]="${c.secondary}"
    theme[cached_mid]=""
    theme[cached_end]="${c.text}"

    theme[available_start]="${c.accent}"
    theme[available_mid]=""
    theme[available_end]="${c.text}"

    theme[used_start]="${c.error}"
    theme[used_mid]=""
    theme[used_end]="${c.accent}"

    theme[download_start]="${c.secondary}"
    theme[download_mid]="${c.accent}"
    theme[download_end]="${c.text}"

    theme[upload_start]="${c.secondary}"
    theme[upload_mid]="${c.accent}"
    theme[upload_end]="${c.text}"
  '';
}
