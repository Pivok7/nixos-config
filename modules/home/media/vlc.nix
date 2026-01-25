{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHomeMedia.vlc;
in
{
  options.modHomeMedia.vlc = {
    enable = lib.mkEnableOption "Enable vlc";
    defaultVideoPlayer = lib.mkEnableOption "Set as default video viewer";
    defaultAudioPlayer = lib.mkEnableOption "Set as default audio viewer";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.vlc
    ];
    modHomeMedia.mime.video.default = (
      if cfg.defaultVideoPlayer then "vlc.desktop" else ""
    );
    modHomeMedia.mime.audio.default = (
      if cfg.defaultAudioPlayer then "vlc.desktop" else ""
    );
  };
}
