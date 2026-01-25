{
  config,
  lib,
  ...
}:

let
  cfg = config.modHomeMedia.mime.pdf;
in
{
  options.modHomeMedia.mime.pdf = {
    default = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Set default pdf viewer";
    };
  };

  config = lib.mkIf (cfg.default != "") {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = cfg.default;
      };
    };
  };
}
