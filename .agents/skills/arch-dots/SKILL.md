---
name: arch-dots
description: >-
  Map, workflows, and gotchas for this machine's Arch Linux dotfiles repo at ~/.arch
  (niri + Noctalia shell + waybar, GNU Stow, metapac). Use this skill whenever working on
  the user's system config: dotfiles, window manager, keybinds, waybar modules, themes,
  packages, shell config, symlinks, systemd user services, or anything under ~/.arch or
  ~/.config — even when the user just says "mis dots", "el repo", "cambia el bind",
  "instala X", "no se sincroniza", "regenera el tema", or asks why a config change isn't
  applied. Always consult this skill before creating a new config directory, adding
  packages, or wiring daemons on this machine.
---

# arch-dots

This is the user's personal machine. The repo at `~/.arch` (shell alias `dots`, env var
`$DOTFILES`) is the single source of truth for everything user-facing: it is versioned,
stowed into `~/.config`, and every package on the system is declared in it. When you
change something, you change it **in the repo**, and you make sure the change actually
reaches the live system.

## The machine

- Arch Linux, `paru` for AUR. User `slydd`, hostname `DEV2DIE`, AMD hardware (amd-ucode, sof-firmware), btrfs + grub + plymouth.
- Wayland. Compositor: **niri**. System shell: **Noctalia** (shell, lock screen, and `noctalia-greeter`). Bar: **waybar-git**. Terminal kitty, editor nvim (NvChad) + zed.
- Outputs: `eDP-1` (laptop panel) + `HDMI-A-1` (1080p@120).

## Repo layout

Only `config/` exists today (stowed to `~/.config`); the repo root also holds
`opencode.json` (config of the AI agent tool itself — its permissions: `sudo` denied,
`rm` / `git push` / `git reset` require approval).

| Repo dir | App | Live location |
|---|---|---|
| `config/niri/` | niri compositor | `~/.config/niri` (dir symlink) |
| `config/noctalia/` | Noctalia shell templates only | `~/.config/noctalia` |
| `config/waybar/` | bar, modular | `~/.config/waybar` |
| `config/kitty/`, `config/zsh/`, `config/starship/` | terminal + shell | idem |
| `config/zed/` | zed editor | idem |
| `config/nvim/` | NvChad neovim | idem |
| `config/btop/`, `config/fastfetch/` | CLI tools | idem |
| `config/metapac/` | package declarations | idem |
| `config/wayland-pipewire-idle-inhibit/` | media idle inhibitor | idem |
| `config/.stowrc` | sets `--target=~/.config` | (never stowed itself) |

**NOT in the repo** (live on the machine only):
- Noctalia runtime settings: `~/.local/state/noctalia/settings.toml` — idle timeouts
  (lock 600 s / screen-off 660 s / lock-and-suspend 900 s), bar layout, widgets, sounds.
  GUI changes land here and are **not versioned**.
- `config/niri/secrets.kdl` (gitignored, included by `config.kdl`).
- `~/.zshrc_local` (sourced by zsh if present; personal secrets).
- `config/zsh/zsh_history`, `.zcompdump*` (live in the stowed dir but gitignored).

## Workflows

### Symlinks (stow)

The user stows the **whole tree at once** — alias `syncdots`:
`stow -d $DOTFILES/config --target=$HOME/.config .`
This creates **directory-level symlinks**: `~/.config/niri -> ../.arch/config/niri`.

- **Never run `stow <package>` for a single package.** Stow 2.4.1 here flattens the
  package contents directly into `~/.config` (real bug seen: a `config.toml` landed at
  `~/.config/config.toml`). Always use the `.` form via `syncdots`, or create the
  directory symlink by hand.
- **New app config**: create `config/<app>/` in the repo, then
  `ln -s ../.arch/config/<app> ~/.config/<app>` (same relative style as the rest).
  Verify with a dry run from the config dir: `stow -n -v .` — it should report the new
  link as already stowed/owned, no conflicts.
- `syncbin` (`bin/` -> `~/.local/bin`) exists as an alias but no `bin/` dir exists yet.

### Packages (metapac)

All packages are declared in `config/metapac/groups/*.toml`: `apps`, `audio`,
`bluetooth`, `desktop`, `dev`, `games`, `network`, `shell`, `system`. Backends:
`arch` (via paru) + `bun`. Aliases: `syncpkg` = `metapac sync && metapac clean`,
`upgrade` = `metapac update`.

- **To add a package: edit the matching group toml, then hand the install command to
  the user** (`syncpkg` / `metapac sync`) — it calls pacman → sudo internally, which
  agents must never run (see `AGENTS.md` §2).
  Never `paru -S` ad hoc either: `metapac clean` (part of `syncpkg`) **uninstalls** any
  package not declared in the groups — an undeclared install will be silently removed
  later.

### Daemons

Prefer **systemd user services** over niri's `spawn-at-startup` for anything that
should restart on failure and survive compositor config edits
(e.g. `wayland-pipewire-idle-inhibit` ships its own unit, enabled via
`systemctl --user enable --now`). `spawn-at-startup` is reserved for session UI
(noctalia, waybar, kdeconnect-indicator, cliphist watchers).

## App notes

- **niri**: `config.kdl` is the entry and `include`s everything: `env.kdl`,
  `secrets.kdl` (gitignored), `noctalia.kdl`, `autostart.kdl`, `ui.kdl`, `rules.kdl`,
  and `binds/{apps,monitor,system,ui,window,workspace}.kdl`. Keybinds spawn Noctalia
  IPC (`noctalia msg ...`); follow the existing style (mostly `spawn-sh` with
  `hotkey-overlay-title`). Validate after edits: `niri validate`.
  `noctalia.kdl` colors are **generated** by Noctalia's builtin niri template.
- **Noctalia**: IPC is `noctalia msg <command>` — run `noctalia msg --help` for the
  full list (panel-toggle, volume/brightness, screenshots, `session lock`,
  `caffeine-toggle`, `config-reload`, ...). The repo owns only the template wiring
  (`templates.toml`) and template inputs (`templates/colors.css` for waybar,
  `templates/zed.json` for zed). Idle/lock behavior lives in the state file (see above),
  not the repo.
- **Generated theme files**: `waybar/colors.css`, `zed/themes/noctalia.json`,
  `kitty/themes/noctalia.conf`, `btop/themes/noctalia.theme`, `niri/noctalia.kdl` are
  rendered by Noctalia from templates (`builtin_ids = gtk3,gtk4,kitty,niri,qt` +
  `user.waybar`, `user.zed` in `templates.toml`). **Edit the template, never the
  output.**
- **waybar**: `config.jsonc` defines the bars and `include`s each module group from
  `modules/<name>/<name>.jsonc` + per-module `style.css`. Add modules by creating that
  pair and adding it to the `include` array.
- **zsh**: `.zshrc` uses oh-my-zsh + plugins from `/usr/share/zsh/plugins`
  (fzf-tab, autosuggestions, syntax-highlighting). Aliases the user types daily:
  `cat`→bat, `ls`→eza, `syncdots`, `syncpkg`, `upgrade`, `dots`, `e`→zed, `n`→nvim.
- **nvim**: NvChad (`chadrc.lua`, `lua/{mappings,options,autocmds}.lua`,
  `lua/configs/{lazy,lspconfig,conform}.lua`, plugins in `lua/plugins/init.lua`).
- **zed**: `settings.json` + `keymap.json`; theme file is generated (see above).

## Gotchas learned on this machine

1. **Noctalia keeps a persistent, silent PipeWire stream** named `noctalia-sound`
   (and the `opencode` TTS keeps one too). `wayland-pipewire-idle-inhibit` treats any
   active stream as media, so its config (`config/wayland-pipewire-idle-inhibit/config.toml`)
   **blacklists** both node names. Removing the blacklists = the machine would never
   idle/lock again. When editing that config, keep them.
2. **Wayland idle only counts keyboard/mouse** — audio playback does not reset it, and
   players like Spotify don't self-inhibit. That's why the inhibitor daemon exists
   (`media_minimum_duration = 5` keeps short notification blips from inhibiting).
3. When changing Noctalia settings via IPC for testing (e.g. `caffeine-toggle`), leave
   things as you found them — the state file persists across sessions.
4. `zsh_history` and `zsh/.zcompdump*` sit inside the stowed dir on purpose (history
   lives at `~/.config/zsh/zsh_history`) but must never be committed — `.gitignore`
   already covers them; keep it that way.

## Before you finish any change

- niri touched → `niri validate`.
- Symlinks touched → `stow -n` dry run from `~/.arch/config`.
- Packages touched → group toml edited and install command handed to the user
  (`metapac sync` needs root; verify with `pacman -Q <pkg>` once they've run it).
- New daemon → `systemctl --user status <unit>` healthy, and it's declared either in
  `autostart.kdl` or as a user unit.
- `.gitignore` still covers secrets/history files; never commit `secrets.kdl`.