{
  config,
  lib,
  ...
}:

let
  cfg = config.modHome.browser.librewolf;
  extensions = import ./firefox/extensions.nix {
    inherit lib;
    inherit cfg;
  };
in
{
  options.modHome.browser.librewolf = {
    enable = lib.mkEnableOption "Setup Librewolf";
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
        # Extensions
        ExtensionSettings = {
          "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
        }
        // extensions.extensionsList;
      };
    };
  };
}
