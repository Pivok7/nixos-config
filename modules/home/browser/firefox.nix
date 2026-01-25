# It's not really hardened firefox because hunting down every option is very time consuming
# and options change with every release so I prefer to use Librewolf

{
  config,
  lib,
  ...
}:

let
  cfg = config.modHome.browser.firefox;
  extensions = import ./firefox/extensions.nix {
    inherit lib;
    inherit cfg;
  };
in
{
  options.modHome.browser.firefox = {
    enable = lib.mkEnableOption "Setup firefox";
    bookmarks = {
      enable = lib.mkEnableOption "Enable bookmarks";
      path = lib.mkOption {
        type = lib.types.path;
        default = ./firefox/bookmarks.html;
        description = "Bookmarks path";
      };
    };
    addons = lib.mkOption {
      type = lib.types.listOf extensions.extensionsEnum;
      default = [ ];
      description = "Enables addons";
    };
  };

  config = lib.mkIf (cfg.enable) {
    programs.firefox = {
      enable = true;
      languagePacks = [
        "pl"
        "en-US"
      ];

      # Policies
      # Check about:policies#documentation for options.
      policies = {
        SearchEngines = {
          Default = "DuckDuckGo";
          PreventInstall = true;
        };
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "newtab"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"

        # Bookmarks
        NoDefaultBookmarks = !cfg.bookmarks.enable;

        # Preferences
        # Check about:config for options.
        Preferences = {
          # Bookmarks pt2
          "browser.bookmarks.file" = cfg.bookmarks.path;
          "browser.places.importBookmarksHTML" = cfg.bookmarks.enable;

          "browser.aboutConfig.showWarning" = false;
          "browser.startup.page" = 1;
          "browser.startup.homepage" = "about:home";
          "browser.newtabpage.enabled" = true;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.default.sites" = "";

          "browser.newtab.preload" = false;
          "browser.newtabpage.activity-stream.feeds.snippets" = false;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
        };

        # Extensions
        ExtensionSettings = {
          "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
        }
        // extensions.extensionsList;
      };
    };
  };
}
