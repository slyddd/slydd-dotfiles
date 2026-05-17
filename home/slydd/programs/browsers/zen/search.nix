{ pkgs, ... }:
{
  programs.zen-browser.profiles.personal.search = {
    force = true;
    default = "google";
    engines = {
      mynixos = {
        name = "My NixOS";
        urls = [
          {
            template = "https://mynixos.com/search?q={searchTerms}";
            params = [ ];
          }
        ];

        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@opt" ];
      };

      nixpkgs = {
        name = "Nixpkgs Search";
        urls = [
          {
            template = "https://search.nixos.org/packages?query={searchTerms}";
            params = [
              {
                name = "channel";
                value = "unstable";
              }
              {
                name = "include_modular_service_options";
                value = "1";
              }
              {
                name = "include_nixos_options";
                value = "1";
              }
            ];
          }
        ];

        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@pkg" ];
      };

      pinterest = {
        name = "Pinterest";
        urls = [
          {
            template = "https://www.pinterest.com/search/pins/?q={searchTerms}";
            params = [ ];
          }
        ];

        definedAliases = [ "@img" ];
      };

      alternativeTo = {
        name = "AlternativeTo";
        urls = [
          {
            template = "https://alternativeto.net/browse/search/?q={searchTerms}";
            params = [ ];
          }
        ];

        definedAliases = [ "@alt" ];
      };

      youtube = {
        name = "Youtube";
        urls = [
          {
            template = "https://www.youtube.com/results?search_query={searchTerms}";
            params = [ ];
          }
        ];

        definedAliases = [ "@video" ];
      };
    };
  };
}
