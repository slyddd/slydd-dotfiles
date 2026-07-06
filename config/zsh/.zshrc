# ╔═╗┬ ┬ ┬┌┬┐┌┬┐  ┌┬┐┌─┐┌┬┐┌─┐
# ╚═╗│ └┬┘ ││ ││───│││ │ │ └─┐
# ╚═╝┴─┘┴ ─┴┘─┴┘  ─┴┘└─┘ ┴ └─┘
# ZSH Configuration File

export PATH="$HOME/.local/bin:$HOME/.bun/bin:$HOME/.cargo/bin:$PATH"
export DOTFILES="$HOME/.arch"
export PLUGINS="/usr/share/zsh/plugins"
export ZSH="/usr/share/oh-my-zsh"
export EDITOR="nvim"
export EDITOR_GUI="zeditor"

# Local secret config
[[ -f ~/.zshrc_local ]] && source ~/.zshrc_local

ZSH_THEME="robbyrussell"

# History settings
HISTFILE="$HOME/.config/zsh/zsh_history"
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
HISTSIZE=5000
SAVEHIST=5000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS

# Completion settings
autoload -Uz compinit
setopt AUTO_CD
compinit

# zsh-autosuggestions settings
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# fzf-tab settings
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no

# Enable plugins
plugins=(
  git
  sudo
  archlinux
)
source $ZSH/oh-my-zsh.sh
source $PLUGINS/fzf-tab/fzf-tab.plugin.zsh
source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source $PLUGINS/zsh-nix-shell/nix-shell.plugin.zsh
source <(fzf --zsh)
source <(zeditor --completions zsh)

# Custom prompts
export SUDO_PROMPT="󰈸 Deploying root access for %u. Password pls: "
command_not_found_handler() {
  printf "%s%s? I don't know what is it  \n" "$acc" "$0" >&2
  return 127
}

# Alias
## Cat
alias cat="bat"
alias catn="/usr/bin/cat"
## Ls
alias ls="eza --icons=always"
alias ll="eza -l --icons=always"
alias la="eza -a --icons=always"
alias lla="eza -la --icons=always"
## Sync
alias syncdots="stow -d $DOTFILES/config --target=$HOME/.config ."
alias syncbin="stow -d $DOTFILES/bin --target=$HOME/.local/bin ."
alias syncpkg="metapac sync && metapac clean"
alias upgrade="metapac update"
## Folders
alias dots="$DOTFILES"
alias bin="$HOME/.local/bin"
alias config="$HOME/.config"
## Editors
alias e="$EDITOR_GUI"
alias n="$EDITOR"

# Starship prompt
fastfetch
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
