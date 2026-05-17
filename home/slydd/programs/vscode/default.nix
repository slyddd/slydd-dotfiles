{ config, pkgs, ... }:

let
  c = config.theme.colorscheme;
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;

    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      extensions =
        let
          urlExtensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
              name = "n8n-as-code";
              publisher = "etienne-lescot";
              version = "0.14.0";
              sha256 = "sha256-kx0ud5f5smmlQL9F8+HL6mPYtXPK4FkGgGmt5SLJgT4=";
            }
          ];
        in
        with pkgs.vscode-extensions;
        [
          continue.continue
          saoudrizwan.claude-dev
          pkief.material-icon-theme
          vscodevim.vim
          usernamehw.errorlens
          bbenoist.nix
          dbaeumer.vscode-eslint
          esbenp.prettier-vscode
          bradlc.vscode-tailwindcss
          astro-build.astro-vscode
          vue.volar
          prisma.prisma
          eamodio.gitlens
        ]
        ++ urlExtensions;

      userSettings = {
        "window.titleBarStyle" = "custom";
        "window.commandCenter" = false;
        "workbench.startupEditor" = "none";
        "workbench.tips.enabled" = false;
        "workbench.tree.indent" = 12;
        "workbench.list.smoothScrolling" = true;

        "workbench.colorTheme" = "Default Dark Modern";
        "workbench.iconTheme" = "material-icon-theme";

        "workbench.sideBar.location" = "left";
        "workbench.secondarySideBar.defaultVisibility" = "visible";
        "workbench.activityBar.location" = "top";
        "workbench.statusBar.visible" = true;
        "workbench.editor.showTabs" = "multiple";
        "workbench.editor.tabSizing" = "shrink";
        "workbench.editor.labelFormat" = "short";
        "workbench.layoutControl.enabled" = true;

        "explorer.openEditors.visible" = 0;
        "explorer.compactFolders" = false;
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;

        "breadcrumbs.enabled" = false;
        "editor.minimap.enabled" = false;
        "editor.stickyScroll.enabled" = false;
        "editor.occurrencesHighlight" = "singleFile";
        "editor.selectionHighlight" = false;
        "editor.overviewRulerBorder" = false;
        "editor.hideCursorInOverviewRuler" = true;
        "editor.renderLineHighlight" = "gutter";
        "editor.renderWhitespace" = "selection";
        "editor.scrollBeyondLastLine" = false;
        "editor.smoothScrolling" = true;
        "editor.inlineSuggest.enabled" = true;
        "editor.quickSuggestionsDelay" = 80;
        "editor.suggestSelection" = "first";
        "editor.linkedEditing" = true;
        "editor.bracketPairColorization.enabled" = true;
        "editor.guides.bracketPairs" = "active";
        "editor.guides.highlightActiveBracketPair" = true;
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";

        "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'FiraCode Nerd Font', monospace";
        "editor.fontSize" = 11;
        "editor.lineHeight" = 1.7;
        "editor.fontLigatures" = true;
        "terminal.integrated.fontFamily" = "'FiraCode Nerd Font Mono', 'FiraCode Nerd Font', monospace";
        "terminal.integrated.fontSize" = 11;
        "terminal.integrated.defaultProfile.linux" = "bash";

        "files.autoSave" = "off";
        "files.trimTrailingWhitespace" = true;
        "files.insertFinalNewline" = true;
        "files.trimFinalNewlines" = true;

        "search.exclude" = {
          "**/.git" = true;
          "**/.direnv" = true;
          "**/.next" = true;
          "**/.nuxt" = true;
          "**/.output" = true;
          "**/.svelte-kit" = true;
          "**/.turbo" = true;
          "**/dist" = true;
          "**/build" = true;
          "**/coverage" = true;
          "**/node_modules" = true;
        };

        "files.exclude" = {
          "**/.DS_Store" = true;
          "**/.direnv" = true;
          "**/.turbo" = true;
        };

        "git.autofetch" = true;
        "git.confirmSync" = false;
        "gitlens.hovers.enabled" = false;

        "continue.enableTabAutocomplete" = true;

        "vim.useSystemClipboard" = true;
        "vim.useCtrlKeys" = true;
        "vim.hlsearch" = true;
        "vim.incsearch" = true;
        "vim.smartRelativeLine" = true;
        "vim.leader" = "<space>";
        "vim.handleKeys" = {
          "<C-a>" = false;
          "<C-f>" = false;
        };
        "vim.normalModeKeyBindingsNonRecursive" = [
          {
            before = [
              "<leader>"
              "e"
            ];
            commands = [ "workbench.view.explorer" ];
          }
          {
            before = [
              "<leader>"
              "<space>"
            ];
            commands = [ "workbench.action.quickOpen" ];
          }
          {
            before = [
              "<leader>"
              "c"
            ];
            commands = [ "editor.action.commentLine" ];
          }
        ];
        "vim.visualModeKeyBindingsNonRecursive" = [
          {
            before = [
              "<leader>"
              "c"
            ];
            commands = [ "editor.action.commentLine" ];
          }
        ];

        "eslint.validate" = [
          "javascript"
          "javascriptreact"
          "typescript"
          "typescriptreact"
          "vue"
          "astro"
        ];

        "typescript.updateImportsOnFileMove.enabled" = "always";
        "javascript.updateImportsOnFileMove.enabled" = "always";

        "tailwindCSS.classAttributes" = [
          "class"
          "className"
          "ngClass"
          "class:list"
        ];

        "tailwindCSS.includeLanguages" = {
          "plaintext" = "html";
        };

        "[javascript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[javascriptreact]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[typescriptreact]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[vue]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[astro]" = {
          "editor.defaultFormatter" = "astro-build.astro-vscode";
        };
        "[prisma]" = {
          "editor.defaultFormatter" = "Prisma.prisma";
        };
        "[json]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[jsonc]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[nix]" = {
          "editor.tabSize" = 2;
        };

        "errorLens.enabled" = true;
        "errorLens.messageEnabled" = true;
        "errorLens.messageBackgroundMode" = "message";
        "errorLens.followCursor" = "allLines";
        "errorLens.fontWeight" = "normal";

        "workbench.colorCustomizations" = {
          "editor.background" = "${c.background}D9";
          "sideBar.background" = "${c.base}CC";
          "sideBar.foreground" = c.text;
          "activityBar.background" = "${c.base}CC";
          "activityBar.foreground" = c.text;
          "activityBar.inactiveForeground" = "${c.text}99";
          "statusBar.background" = "${c.base}E6";
          "statusBar.foreground" = c.text;
          "titleBar.activeBackground" = "${c.base}CC";
          "titleBar.activeForeground" = c.text;
          "titleBar.inactiveBackground" = "${c.base}99";
          "titleBar.inactiveForeground" = "${c.text}99";
          "editorGroupHeader.tabsBackground" = "${c.base}B3";
          "tab.activeBackground" = "${c.background}D9";
          "tab.activeForeground" = c.text;
          "tab.inactiveBackground" = "${c.base}99";
          "tab.inactiveForeground" = "${c.text}99";
          "panel.background" = "${c.base}CC";
          "panel.border" = "${c.accent}66";
          "editorWidget.background" = "${c.base}F2";
          "editorWidget.border" = "${c.accent}66";
          "input.background" = "${c.base}CC";
          "input.foreground" = c.text;
          "input.border" = "${c.accent}66";
          "inputOption.activeBorder" = c.accent;
          "focusBorder" = "${c.accent}99";
          "selection.background" = "${c.accent}40";
          "editor.lineHighlightBackground" = "${c.accent}14";
          "editorCursor.foreground" = c.accent;
          "editorIndentGuide.background1" = "${c.secondary}22";
          "editorIndentGuide.activeBackground1" = "${c.accent}66";
          "editorBracketMatch.border" = c.accent;
          "editorBracketPairGuide.activeBackground1" = c.accent;
          "editorBracketPairGuide.activeBackground2" = c.secondary;
          "editorBracketPairGuide.activeBackground3" = c.error;
          "editorError.foreground" = c.error;
          "editorWarning.foreground" = c.secondary;
          "list.activeSelectionBackground" = "${c.accent}33";
          "list.hoverBackground" = "${c.accent}1F";
          "minimap.background" = "${c.base}66";
          "terminal.background" = "${c.background}D9";
          "terminal.foreground" = c.foreground;
          "terminalCursor.foreground" = c.accent;
          "scrollbar.shadow" = "#00000000";
          "scrollbarSlider.background" = "${c.accent}33";
          "scrollbarSlider.hoverBackground" = "${c.accent}55";
          "scrollbarSlider.activeBackground" = "${c.accent}77";
        };
      };

      keybindings = [
        {
          key = "ctrl+t";
          command = "workbench.action.terminal.toggleTerminal";
        }
        {
          key = "ctrl+b";
          command = "workbench.action.toggleSidebarVisibility";
        }
        {
          key = "ctrl+alt+b";
          command = "workbench.action.toggleAuxiliaryBar";
        }
        {
          key = "a";
          command = "explorer.newFile";
          when = "filesExplorerFocus && !inputFocus";
        }
        {
          key = "d";
          command = "deleteFile";
          when = "filesExplorerFocus && !inputFocus";
        }
        {
          key = "r";
          command = "renameFile";
          when = "filesExplorerFocus && !inputFocus";
        }
        {
          key = "y";
          command = "filesExplorer.copy";
          when = "filesExplorerFocus && !inputFocus";
        }
        {
          key = "p";
          command = "filesExplorer.paste";
          when = "filesExplorerFocus && !inputFocus";
        }
        {
          key = "x";
          command = "filesExplorer.cut";
          when = "filesExplorerFocus && !inputFocus";
        }
        {
          key = "tab";
          command = "-acceptSelectedSuggestion";
          when = "suggestWidgetVisible";
        }
      ];
    };
  };
}
