# AGENTS.md

Binding rules for AI agents working in this repository. This repo IS the user's live
system: these files are symlinked into `~/.config`, packages are declared here, and
the compositor and shell run from them. Treat every change as a change to a running
machine.

## 1. Research first — no edits from memory

Before editing any config (keybind, waybar module, option, package, service):

1. **Look at how others do it.** Use the `gh_grep` MCP server (grep.app, configured in
   `opencode.json`) to search real-world configs and dotfiles on GitHub for the exact
   feature you are touching (e.g. `windowrule` for sway/hyprland, `layer-rule` for
   niri, `media_minimum_duration` for pipewire tooling). This catches deprecated
   options and established idioms before they land here. Searching is mandatory, not
   optional decoration.
2. **Check the official, current documentation of the installed version** (niri wiki,
   Noctalia docs, waybar man pages, stow/manual, metapac README...). Do not trust
   recall of option names or syntax — verify against what is actually installed
   (`<tool> --version`, `<tool> --help`). Docs for the wrong version are worse than
   none.
3. Only then edit. If the sources disagree, the official docs of the installed version
   win, and you note the discrepancy to the user.

For this repo's own map, workflows, and machine-specific gotchas, read
`.agents/skills/arch-dots/SKILL.md` first.

## 2. sudo is forbidden

- Never run `sudo`, and never reach root through workarounds: `su`, `doas`, `pkexec`,
  `run0`, editing root-owned files, or scripts/wrappers that invoke them.
- This includes package installs: `metapac sync` → `paru` → `pacman` calls sudo
  internally. The agent's job ends at editing `config/metapac/groups/*.toml`; the user
  runs the install command themselves.
- When a step genuinely needs root: **stop, tell the user the exact command(s) to run
  manually, and wait for their confirmation before continuing.** Afterwards, verify
  the effect without root (e.g. `pacman -Q <pkg>`, reading the modified file).
- Do not attempt to evade the `sudo` denial configured in `opencode.json` — it is a
  backstop, not the only guard.

## 3. Nothing outside this repo without asking

- Edit only files under `~/.arch`. That covers configs symlinked into `~/.config`
  too — always touch them through the repo path, never "directly" outside.
- Never edit, delete, or create any file outside the repo without asking the user
  first and getting an explicit yes. This includes: `~/.local/state/noctalia/settings.toml`
  (Noctalia's live settings/state), anything else in `~/.local` or `$HOME` not managed
  here, `/etc`, systemd unit overrides, `/usr`, and anything a command would write
  outside the repo as a side effect.
- Asking means: name the file, show the intended change, and wait for approval.
- Files that are machine-generated outputs (`waybar/colors.css`, `zed/themes/noctalia.json`,
  `kitty/themes/noctalia.conf`, `btop/themes/noctalia.theme`, `niri/noctalia.kdl`) are
  off-limits for direct edits anywhere; change their templates in the repo instead.

## 4. Don't leak secrets

`config/niri/secrets.kdl`, `.env*`, `~/.zshrc_local`, and `config/zsh/zsh_history` are
gitignored on purpose. Never stage, commit, copy, or print them.

---

If a rule above blocks something the user just asked for, say which rule and why —
never route around one silently.