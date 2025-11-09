{
  config,
  lib,
  ...
}:

let
  cfg = config.modHomeMedia.firefox;
in
{
  options.modHomeMedia.firefox = {
    enable = lib.mkEnableOption "Setup firefox";
    bookmarks = {
      enable = lib.mkEnableOption "Enable bookmarks";
      path = lib.mkOption {
        type = lib.types.path;
        default = ./bookmarks.html;
        description = "Bookmarks path";
      };
    };
    addons = lib.mkOption {
      type = lib.types.listOf (
        lib.types.enum [
          "ublock"
          "adnauseam"
          "dark-reader"
          "bandcamp-volume"
          "bandcamp-killer"
          "youtube-dislike"
          "youtube-unhook"
        ]
      );
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

      # ---- POLICIES ----
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

        # ---- PREFERENCES ----
        # Check about:config for options.
        Preferences = {
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
          "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;

          "geo.provider.use_geoclue" = false;
          "intl.accept_languages" = "en-US, en";
          "javascript.use_us_english_locale" = true;

          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          "browser.discovery.enabled" = false;

          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.server" = "data:,";
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.coverage.opt-out" = true;
          "toolkit.coverage.opt-out" = true;
          "toolkit.coverage.endpoint.base" = "";

          "app.shield.optoutstudies.enabled" = false;
          "app.normandy.enabled" = false;
          "app.normandy.api_url" = "";
          "breakpad.reportURL" = "";
          "browser.tabs.crashReporting.sendRepor" = false;

          "browser.safebrowsing.malware.enabled" = false;
          "browser.safebrowsing.phishing.enabled" = false;
          "browser.safebrowsing.blockedURIs.enabled" = false;
          "browser.safebrowsing.provider.google4.gethashURL" = "";
          "browser.safebrowsing.provider.google4.updateURL" = "";
          "browser.safebrowsing.provider.google.gethashURL" = "";
          "browser.safebrowsing.provider.google.updateURL" = "";
          "browser.safebrowsing.provider.google4.dataSharingURL" = "";
          "browser.safebrowsing.downloads.enabled" = false;
          "browser.safebrowsing.downloads.remote.enabled" = false;
          "browser.safebrowsing.downloads.remote.url" = "";
          "browser.safebrowsing.downloads.remote.block_potentially_unwanted" = false;
          "browser.safebrowsing.downloads.remote.block_uncommon" = false;
          "browser.safebrowsing.allowOverride" = false;

          "network.prefetch-next" = false;
          "network.dns.disablePrefetch" = true;
          "network.dns.disablePrefetchFromHTTPS" = true;
          "network.predictor.enabled" = false;
          "network.http.speculative-parallel-limit" = 0;
          "browser.places.speculativeConnect.enabled" = false;
          "network.gio.supported-protocols" = "";
          "network.file.disable_unc_paths" = false;
          "permissions.manager.defaultsUrl" = "";
          "network.IDN_show_punycode" = true;
          "captivedetect.canonicalURL" = "";
          "network.captive-portal-service.enabled" = false;
          "network.connectivity-service.enabled" = false;

          "browser.urlbar.speculativeConnect.enabled" = false;
          "browser.urlbar.quicksuggest.enabled" = false;
          "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;
          "browser.search.suggest.enabled" = false;
          "browser.urlbar.suggest.searches" = false;
          "browser.urlbar.trending.featureGate" = false;
          "browser.urlbar.addons.featureGate" = false;
          "browser.urlbar.mdn.featureGate" = false;
          "browser.urlbar.yelp.featureGate" = false;
          "browser.formfill.enable" = false;
          "extensions.formautofill.addresses.enabled" = false;
          "extensions.formautofill.creditCards.available" = false;

          "signon.rememberSignons" = false;
          "signon.autofillForms" = false;
          "signon.formlessCapture.enabled" = false;
          "network.auth.subresource-http-auth-allow" = 1;

          "browser.cache.disk.enable" = false;
          "browser.privatebrowsing.forceMediaMemoryCache" = true;
          "media.memory_cache_max_size" = 65536;
          "browser.sessionstore.privacy_level" = 2;
          "browser.sessionstore.resume_from_crash" = false;
          "toolkit.winRegisterApplicationRestart" = false;
          "browser.pagethumbnails.capturing_disabled" = true;
          "browser.download.start_downloads_in_tmp_dir" = true;
          "browser.helperApps.deleteTempFileOnExit" = true;

          "security.tls.enable_0rtt_data" = false;
          "security.OCSP.require" = true;
          "browser.xul.error_pages.expert_bad_cert" = true;
          "security.cert_pinning.enforcement_level" = 2;
          "security.remote_settings.crlite_filters.enabled" = true;
          "security.pki.crlite_mode" = 2;
          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_send_http_background_request" = false;
          "network.http.referer.XOriginTrimmingPolicy" = 2;

          "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
          "media.peerconnection.ice.default_address_only" = true;
          "media.peerconnection.ice.no_host" = true;

          "webgl.disabled" = false;
          "media.autoplay.default" = 5;
          "media.eme.enabled" = true;

          "browser.download.useDownloadDir" = false;
          "browser.download.manager.addToRecentDocs" = false;
          "browser.download.always_ask_before_handling_new_types" = false;

          "browser.contentblocking.category" = {
            Value = "strict";
            Status = "locked";
          };

          "dom.popup_allowed_events" = "click dblclick mousedown pointerdown";
          "pdfjs.enableScripting" = false;
          "privacy.userContext.enabled" = true;
          "privacy.userContext.ui.enabled" = true;

          "extensions.enabledScopes" = 5;
          "extensions.postDownloadThirdPartyPrompt" = false;

          "privacy.sanitize.sanitizeOnShutdown" = true;
          "privacy.clearOnShutdown.cookies" = true;
          "privacy.clearOnShutdown.offlineApps" = true;
          "privacy.sanitize.timeSpan" = true;

          "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = true;
          "privacy.clearOnShutdown_v2.cache" = true;
          "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
          "privacy.clearOnShutdown_v2.formdata" = true;
          "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = true;

          "privacy.resistFingerprinting" = true;
          "privacy.resistFingerprinting.letterboxing" = false;
          "privacy.resistFingerprinting.block_mozAddonManager" = true;
          "privacy.spoof_english" = 1;
          "widget.non-native-theme.use-theme-accent" = false;
          "browser.link.open_newwindow.restriction" = 0;
        };
        # ---- EXTENSIONS ----
        # Check about:support for extension/add-on ID strings.
        # Valid strings for installation_mode are "allowed", "blocked",
        # "force_installed" and "normal_installed".
        ExtensionSettings = {
          "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
          # uBlock Origin:
          "uBlock0@raymondhill.net" = lib.mkIf (lib.elem "ublock" cfg.addons) {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
          # AdNauseum
          "adnauseam@rednoise.org" = lib.mkIf (lib.elem "adnauseam" cfg.addons) {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4592803/adnauseam-3.26.0.xpi";
            installation_mode = "force_installed";
          };
          # Dark reader
          "addon@darkreader.org" = lib.mkIf (lib.elem "dark-reader" cfg.addons) {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4598977/darkreader-4.9.112.xpi";
            installation_mode = "force_installed";
          };
          # Bandcamp volume control
          "{308ec088-284a-40fe-ae14-7c917526f694}" = lib.mkIf (lib.elem "bandcamp-volume" cfg.addons) {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4084124/bandcamp_player_volume_control-1.0.3.xpi";
            installation_mode = "force_installed";
          };
          # Bandcamp killer
          "{1bac25ad-d6dd-44c9-bc95-628027e5e126}" = lib.mkIf (lib.elem "bandcamp-killer" cfg.addons) {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/3499802/bandcamp_killer_1_0-1.0.xpi";
            installation_mode = "force_installed";
          };
          # Return youtube dislike
          "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = lib.mkIf (lib.elem "youtube-dislike" cfg.addons) {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4371820/return_youtube_dislikes-3.0.0.18.xpi";
            installation_mode = "force_installed";
          };
          # Youtube unhook
          "myallychou@gmail.com" = lib.mkIf (lib.elem "youtube-unhook" cfg.addons) {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4263531/youtube_recommended_videos-1.6.7.xpi";
            installation_mode = "force_installed";
          };
        };
      };
    };
  };
}
