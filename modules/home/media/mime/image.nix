{
  config,
  lib,
  ...
}:

let
  cfg = config.modHomeMedia.mime.image;
in
{
  options.modHomeMedia.mime.image = {
    default = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Set default image viewer";
    };
  };

  config = lib.mkIf (cfg.default != "") {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "image/avif" = cfg.default;
        "image/avif-sequence" = cfg.default;
        "image/bmp" = cfg.default;
        "image/cgm" = cfg.default;
        "image/g3fax" = cfg.default;
        "image/gif" = cfg.default;
        "image/heic" = cfg.default;
        "image/ief" = cfg.default;
        "image/jpeg" = cfg.default;
        "image/pjpeg" = cfg.default;
        "image/png" = cfg.default;
        "image/prs.btif" = cfg.default;
        "image/qoi" = cfg.default;
        "image/svg+xml" = cfg.default;
        "image/tiff" = cfg.default;
        "image/vnd.adobe.photoshop" = cfg.default;
        "image/vnd.djvu" = cfg.default;
        "image/vnd.dwg" = cfg.default;
        "image/vnd.dxf" = cfg.default;
        "image/vnd.fastbidsheet" = cfg.default;
        "image/vnd.fpx" = cfg.default;
        "image/vnd.fst" = cfg.default;
        "image/vnd.fujixerox.edmics-mmr" = cfg.default;
        "image/vnd.fujixerox.edmics-rlc" = cfg.default;
        "image/vnd.ms-modi" = cfg.default;
        "image/vnd.net-fpx" = cfg.default;
        "image/vnd.wap.wbmp" = cfg.default;
        "image/vnd.xiff" = cfg.default;
        "image/webp" = cfg.default;
        "image/x-adobe-dng" = cfg.default;
        "image/x-canon-cr2" = cfg.default;
        "image/x-canon-crw" = cfg.default;
        "image/x-cmu-raster" = cfg.default;
        "image/x-cmx" = cfg.default;
        "image/x-epson-erf" = cfg.default;
        "image/x-freehand" = cfg.default;
        "image/x-fuji-raf" = cfg.default;
        "image/x-icns" = cfg.default;
        "image/x-icon" = cfg.default;
        "image/x-kodak-dcr" = cfg.default;
        "image/x-kodak-k25" = cfg.default;
        "image/x-kodak-kdc" = cfg.default;
        "image/x-minolta-mrw" = cfg.default;
        "image/x-nikon-nef" = cfg.default;
        "image/x-olympus-orf" = cfg.default;
        "image/x-panasonic-raw" = cfg.default;
        "image/x-pcx" = cfg.default;
        "image/x-pentax-pef" = cfg.default;
        "image/x-pict" = cfg.default;
        "image/x-portable-anymap" = cfg.default;
        "image/x-portable-bitmap" = cfg.default;
        "image/x-portable-graymap" = cfg.default;
        "image/x-portable-pixmap" = cfg.default;
        "image/x-rgb" = cfg.default;
        "image/x-sigma-x3f" = cfg.default;
        "image/x-sony-arw" = cfg.default;
        "image/x-sony-sr2" = cfg.default;
        "image/x-sony-srf" = cfg.default;
        "image/x-xbitmap" = cfg.default;
        "image/x-xpixmap" = cfg.default;
        "image/x-xwindowdump" = cfg.default;
      };
    };
  };
}
