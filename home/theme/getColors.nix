{ pkgs, wallpaper, mode ? "dark", schemeType ? "scheme-neutral" }:

let
  matugenJson = pkgs.runCommand "matugen-colors.json" { buildInputs = [ pkgs.matugen ]; } ''
    matugen image ${wallpaper} --json hex -t ${schemeType}> $out
  '';
  j = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile matugenJson));
  c = name: j.colors.${name}.${mode};
in
{
  base = c "surface";
  text = c "on_surface";
  accent = c "primary";
  secondary = c "secondary";
  error = c "error";
  background = c "background";
  foreground = c "on_background";
}
