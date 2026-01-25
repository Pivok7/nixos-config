{ lib, cfg, ... }:
{
  extensionsEnum = lib.types.enum [
    "ublock"
    "adnauseam"
    "clean-urls"
    "dark-reader"
    "bandcamp-volume"
    "bandcamp-killer"
    "youtube-dislike"
    "youtube-unhook"
  ];

  # Check about:support for extension/add-on ID strings.
  # Valid strings for installation_mode are "allowed", "blocked",
  # "force_installed" and "normal_installed".
  extensionsList = {
    # uBlock Origin:
    "uBlock0@raymondhill.net" = lib.mkIf (lib.elem "clean-urls" cfg.addons) {
      install_url = "https://addons.mozilla.org/firefox/downloads/file/4432106/clearurls-1.27.3.xpi";
      installation_mode = "force_installed";
    };
    # AdNauseum
    "adnauseam@rednoise.org" = lib.mkIf (lib.elem "adnauseam" cfg.addons) {
      install_url = "https://addons.mozilla.org/firefox/downloads/file/4592803/adnauseam-3.26.0.xpi";
      installation_mode = "force_installed";
    };
    # CleanURLs
    "{74145f27-f039-47ce-a470-a662b129930a}" = lib.mkIf (lib.elem "dark-reader" cfg.addons) {
      install_url = "https://addons.mozilla.org/firefox/downloads/file/4432106/clearurls-1.27.3.xpi";
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
}
