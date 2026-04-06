{ pkgs, ... }:
{
  programs.zed-editor = {
    extensions = [
      "nix"
      "json"
      "material-icon-theme"
      "catppuccin-blur"
      "catppuccin"
    ];

    extraPackages = with pkgs; [
      nixd
      nil
      nixfmt
    ];
  };
}
