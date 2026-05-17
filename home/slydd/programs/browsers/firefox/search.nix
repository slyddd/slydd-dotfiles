{ ... }:
{
  programs.firefox.profiles.personal.search = {
    force = true;
    default = "google";
    engines = {
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
