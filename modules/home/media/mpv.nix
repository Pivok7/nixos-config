{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.media.mpv;
in
{
  options.modHome.media.mpv = {
    enable = lib.mkEnableOption "Enable mpv";
    defaultVideoPlayer = lib.mkEnableOption "Set as default video viewer";
    defaultAudioPlayer = lib.mkEnableOption "Set as default audio viewer";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.mpv
    ];
    modHomeMedia.mime.video.default = (
      if cfg.defaultVideoPlayer then "mpv.desktop" else ""
    );
    modHomeMedia.mime.audio.default = (
      if cfg.defaultAudioPlayer then "mpv.desktop" else ""
    );
  };
}
