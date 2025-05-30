{ pkgs, ... }:
{
   programs.zed-editor = {
    extensions = [
      "nix"
      "json"
      "catppuccin-blur"
      "catppuccin"
      "material-icon-theme"
    ];

    extraPackages = with pkgs; [
      nixd
      nil
      nixfmt-rfc-style
    ];
  };
}
