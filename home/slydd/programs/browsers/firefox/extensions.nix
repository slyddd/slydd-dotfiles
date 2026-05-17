{ inputs, pkgs, ... }:
{

  programs.firefox = {
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
    };
  };
}
