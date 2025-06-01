{ config, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "FiraCode Nerd Font:size=11";
        lines = 10;
        vertical-pad = 30;
        inner-pad = 30;
        tabs = 12;
        exit-on-keyboard-focus-loss = true;
      };
      colors =
        let
          inherit (config.theme) colorscheme;
        in
        {
          background = "${colorscheme.base}ff";
          text = "${colorscheme.text}ff";
          selection = "${colorscheme.accent}ff";
        };
    };
  };
}
