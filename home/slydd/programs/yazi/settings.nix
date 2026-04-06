{ ... }:

{
  programs.yazi.settings = {
    plugin = {
      prepend_fetchers = [
        {
          id = "mime";
          url = "local://*";
          run = "mime-ext.local";
          prio = "high";
        }
        {
          id = "mime";
          url = "remote://*";
          run = "mime-ext.remote";
          prio = "high";
        }
      ];

      prepend_preloaders = [
        {
          mime = "application/openxmlformats-officedocument.*";
          run = "office";
        }
        {
          mime = "application/oasis.opendocument.*";
          run = "office";
        }
        {
          mime = "application/ms-*";
          run = "office";
        }
        {
          mime = "application/msword";
          run = "office";
        }
        {
          url = "*.docx";
          run = "office";
        }
        {
          url = "*.xlsx";
          run = "office";
        }
        {
          url = "*.pptx";
          run = "office";
        }
        {
          url = "*.odt";
          run = "office";
        }
        {
          url = "*.ods";
          run = "office";
        }
        {
          url = "*.odp";
          run = "office";
        }
      ];

      prepend_previewers = [
        {
          mime = "application/{*zip,tar,bzip2,7z*,rar,xz,zstd,java-archive}";
          run = "ouch";
        }

        {
          mime = "video/*";
          run = "mediainfo";
        }
        {
          mime = "audio/*";
          run = "mediainfo";
        }
        {
          mime = "image/*";
          run = "mediainfo";
        }

        {
          mime = "application/openxmlformats-officedocument.*";
          run = "office";
        }
        {
          mime = "application/oasis.opendocument.*";
          run = "office";
        }
        {
          mime = "application/ms-*";
          run = "office";
        }
        {
          mime = "application/msword";
          run = "office";
        }
        {
          url = "*.docx";
          run = "office";
        }
        {
          url = "*.xlsx";
          run = "office";
        }
        {
          url = "*.pptx";
          run = "office";
        }
        {
          url = "*.odt";
          run = "office";
        }
        {
          url = "*.ods";
          run = "office";
        }
        {
          url = "*.odp";
          run = "office";
        }

        {
          url = "*.md";
          run = "rich-preview";
        }
        {
          url = "*.json";
          run = "rich-preview";
        }
        {
          url = "*.csv";
          run = "rich-preview";
        }
        {
          url = "*.ipynb";
          run = "rich-preview";
        }
        {
          url = "*.rst";
          run = "rich-preview";
        }
      ];
    };

    opener = {
      open = [
        {
          run = "xdg-open %s";
          orphan = true;
          desc = "xdg-open";
          for = "linux";
        }
      ];
    };

    open = {
      rules = [
        {
          url = "*";
          use = "open";
        }
      ];
    };
  };
}
