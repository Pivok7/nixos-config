{
  config,
  lib,
  ...
}:

let
  cfg = config.modHomeMedia.mime.video;
in
{
  options.modHomeMedia.mime.video = {
    default = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Set default video viewer";
    };
  };

  config = lib.mkIf (cfg.default != "") {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "video/3gpp" = cfg.default;
        "video/3gpp2" = cfg.default;
        "video/h261" = cfg.default;
        "video/h263" = cfg.default;
        "video/h264" = cfg.default;
        "video/jpeg" = cfg.default;
        "video/jpm" = cfg.default;
        "video/mj2" = cfg.default;
        "video/mp2t" = cfg.default;
        "video/mp4" = cfg.default;
        "video/mpeg" = cfg.default;
        "video/ogg" = cfg.default;
        "video/quicktime" = cfg.default;
        "video/vnd.fvt" = cfg.default;
        "video/vnd.mpegurl" = cfg.default;
        "video/vnd.ms-playready.media.pyv" = cfg.default;
        "video/vnd.vivo" = cfg.default;
        "video/webm" = cfg.default;
        "video/x-f4v" = cfg.default;
        "video/x-fli" = cfg.default;
        "video/x-flv" = cfg.default;
        "video/x-m4v" = cfg.default;
        "video/x-matroska" = cfg.default;
        "video/x-ms-asf" = cfg.default;
        "video/x-ms-wm" = cfg.default;
        "video/x-ms-wmv" = cfg.default;
        "video/x-ms-wmx" = cfg.default;
        "video/x-ms-wvx" = cfg.default;
        "video/x-msvideo" = cfg.default;
        "video/x-sgi-movie" = cfg.default;
      };
    };
  };
}
