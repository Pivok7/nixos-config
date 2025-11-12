{
  config,
  lib,
  ...
}:

let
  cfg = config.modHomeMedia.mime.audio;
in
{
  options.modHomeMedia.mime.audio = {
    default = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Set default audio viewer";
    };
  };

  config = lib.mkIf (cfg.default != "") {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "audio/3gpp2" = cfg.default;
        "audio/aac" = cfg.default;
        "audio/aacp" = cfg.default;
        "audio/adpcm" = cfg.default;
        "audio/aiff" = cfg.default;
        "audio/x-aiff" = cfg.default;
        "audio/basic" = cfg.default;
        "audio/flac" = cfg.default;
        "audio/midi" = cfg.default;
        "audio/mp4" = cfg.default;
        "audio/mp4a-latm" = cfg.default;
        "audio/mpeg" = cfg.default;
        "audio/ogg" = cfg.default;
        "audio/opus" = cfg.default;
        "audio/vnd.digital-winds" = cfg.default;
        "audio/vnd.dts" = cfg.default;
        "audio/vnd.dts.hd" = cfg.default;
        "audio/vnd.lucent.voice" = cfg.default;
        "audio/vnd.ms-playready.media.pya" = cfg.default;
        "audio/vnd.nuera.ecelp4800" = cfg.default;
        "audio/vnd.nuera.ecelp7470" = cfg.default;
        "audio/vnd.nuera.ecelp9600" = cfg.default;
        "audio/vnd.wav" = cfg.default;
        "audio/wav" = cfg.default;
        "audio/x-wav" = cfg.default;
        "audio/vnd.wave" = cfg.default;
        "audio/wave" = cfg.default;
        "audio/x-pn-wav" = cfg.default;
        "audio/webm" = cfg.default;
        "audio/x-matroska" = cfg.default;
        "audio/x-mpegurl" = cfg.default;
        "audio/x-ms-wax" = cfg.default;
        "audio/x-ms-wma" = cfg.default;
        "audio/x-pn-realaudio" = cfg.default;
        "audio/x-pn-realaudio-plugin" = cfg.default;
      };
    };
  };
}
