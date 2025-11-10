{
  config,
  lib,
  ...
}:

let
  cfg = config.modHomeBrowser.librewolf;
  extensions = import ./firefox/extensions.nix {
    inherit lib;
    inherit cfg;
  };
in
{
  options.modHomeBrowser.librewolf = {
    enable = lib.mkEnableOption "Setup Librewolf";
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
    programs.librewolf = {
      enable = true;
      settings = {
        "webgl.disabled" = false;
        "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = true;
        "privacy.clearOnShutdown_v2.cache" = true;
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
        "privacy.clearOnShutdown_v2.formdata" = true;
        "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = true;
      };

      # Policies
      # Check about:policies#documentation for options.
      policies = {
        # Bookmarks
        NoDefaultBookmarks = !cfg.bookmarks.enable;
        Preferences = {
          "browser.bookmarks.file" = cfg.bookmarks.path;
          "browser.places.importBookmarksHTML" = cfg.bookmarks.enable;
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
