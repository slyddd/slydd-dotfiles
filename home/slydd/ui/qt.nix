{ pkgs, config, ... }:
{
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    style.name = "kvantum";
  };

  home.packages = with pkgs; [
    qt6Packages.qt6ct
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_STYLE_OVERRIDE = "kvantum";
  };

  xdg.configFile."qt6ct/qt6ct.conf".text = ''
    [Appearance]
    color_scheme_path=${config.xdg.configHome}/qt6ct/colors/matugen.conf
  '';
}
