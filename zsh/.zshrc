export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$HOME/.bun/bin:$PATH"
export EDITOR="nvim"

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


#fzf settings
export FZF_DEFAULT_OPTS_FILE="$HOME/.config/fzf/.fzfrc"

# zsh-autosuggestions settings
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# fzf-tab settings
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
export LESSOPEN='|~/.config/fzf/fzf-preview.sh %s'
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':completion:*' menu no

# Enable plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf-tab
  sudo
)
source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

# Custom prompts
export SUDO_PROMPT="󰈸 Deploying root access for %u. Password pls: "
command_not_found_handler() {
  printf "%s%s? I don't know what is it  \n" "$acc" "$0" >&2
  return 127
}

# Alias
alias cat="bat"
alias ls="eza --icons=always"
alias ll="eza -l --icons=always"
alias la="eza -a --icons=always"
alias lla="eza -la --icons=always"

# Starship prompt
fastfetch
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
