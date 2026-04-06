{ pkgs, ... }:
let
  filePreview = "${pkgs.bat}/bin/bat --color=always --style=numbers --line-range=:500 {}";
  dirPreview = "${pkgs.eza}/bin/eza --color=always --icons=always --tree --level=2 {}";
in
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh.initContent = ''
    export FZF_DEFAULT_OPTS="
      --height=60%
      --layout=reverse
      --border
      --ansi
      --prompt='❯ '
      --pointer='▶'
      --marker='✓'
      --color=bg+:-1,fg+:15,hl:6,hl+:14,info:4,prompt:6,pointer:14,marker:2,spinner:4,header:8
    "
    export FZF_CTRL_T_OPTS="--preview '${filePreview}' --preview-window=right,60%,border-left"
    export FZF_ALT_C_OPTS="--preview '${dirPreview}' --preview-window=right,60%,border-left"
  '';
}
