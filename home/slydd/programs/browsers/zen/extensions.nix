{ inputs, pkgs, ... }:
{

  programs.zen-browser = {
    policies =
      let
        mkExtensionSettings = builtins.mapAttrs (
          _: pluginId: {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
            installation_mode = "force_installed";
          }
        );

      in
      {
        ExtensionSettings = mkExtensionSettings {
          "{6def1df3-6313-4648-a6ca-945b92aba510}" = "no-google-search-translation";
        };
      };

    profiles.personal = {
      extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
        ublock-origin
        vimium
        catppuccin-web-file-icons
        bitwarden
      ];

      mods = [
        "a6335949-4465-4b71-926c-4a52d34bc9c0"
        "906c6915-5677-48ff-9bfc-096a02a72379"
        "d8b79d4a-6cba-4495-9ff6-d6d30b0e94fe"
        "4ab93b88-151c-451b-a1b7-a1e0e28fa7f8"
        "79dde383-4fe7-404a-a8e6-9be440022542"
        "5941aefd-67b0-453d-9b62-9071a31cbb0d"
        "c8d9e6e6-e702-4e15-8972-3596e57cf398"
        "8039de3b-72e1-41ea-83b3-5077cf0f98d1"
        "20e8cc78-3dac-4db0-81a4-814672fb50af"
        "6cd4bca9-f17d-4461-b554-844d69a4887c"
        "f4866f39-cfd6-4498-ab92-54213b8279dc"
        "03a8e7ef-cf00-4f41-bf24-a90deeafc9db"
        "81fcd6b3-f014-4796-988f-6c3cb3874db8"
        "e51b85e6-cef5-45d4-9fff-6986637974e1"
        "a5f6a231-e3c8-4ce8-8a8e-3e93efd6adec"
        "599a1599-e6ab-4749-ab22-de533860de2c"
        "e74cb40a-f3b8-445a-9826-1b1b6e41b846"
      ];
    };
  };
}
