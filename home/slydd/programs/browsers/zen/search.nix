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
            params = [
              {
                name = "query";
                value = "searchTerms";
              }
            ];
          }
        ];

        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@opt" ];
      };

      nixpkgs = {
        name = "Nixpkgs Search";
        urls = [
          {
            template = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
            params = [
              {
                name = "query";
                value = "searchTerms";
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
            params = [
              {
                name = "query";
                value = "searchTerms";
              }
            ];
          }
        ];

        definedAliases = [ "@img" ];
      };

      alternativeTo = {
        name = "AlternativeTo";
        urls = [
          {
            template = "https://alternativeto.net/browse/search/?q={searchTerms}";
            params = [
              {
                name = "query";
                value = "searchTerms";
              }
            ];
          }
        ];

        definedAliases = [ "@alt" ];
      };
    };
  };
}
